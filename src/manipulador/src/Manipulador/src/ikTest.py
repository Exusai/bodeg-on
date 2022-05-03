import numpy as np 
import matplotlib.pyplot as plt 
import math

# Robot Link Length Parameter
link = [1.1, 0.9]
# Robot Initial Joint Values (degree)
angle = [26.60 + 90, 119]
# Target End of Effector Position
target = [0, 0, 0] 

# Pallet size
height = 1.2
width = 1.0

pallet_x1 = 0 - width/2
pallet_x2 = width - width/2

pallet_y1 = 0
pallet_y2 = 0

# Create figure to plot
fig = plt.figure() 
ax = fig.add_subplot(1,1,1)

def rotateZ(theta):
    rz = np.array([[math.cos(theta), - math.sin(theta), 0, 0],
                   [math.sin(theta), math.cos(theta), 0, 0],
                   [0, 0, 1, 0],
                   [0, 0, 0, 1]])
    return rz

def translate(dx, dy, dz):
    t = np.array([[1, 0, 0, dx],
                  [0, 1, 0, dy],
                  [0, 0, 1, dz],
                  [0, 0, 0, 1]])
    return t

# Forward Kinematics
# Input initial angles and length of links
# Output positions each points
def FK(angle, link):
    n_links = len(link)
    P = []
    P.append(np.eye(4))
    for i in range(0, n_links):
        R = rotateZ(angle[i]/180*math.pi)
        T = translate(link[i], 0, 0)
        P.append(P[-1].dot(R).dot(T))
    return P

def IK(target, angle, link, max_iter = 10000, err_min = 0.01):
    solved = False
    err_end_to_target = math.inf
    
    for loop in range(max_iter):
        for i in range(len(link)-1, -1, -1):
            P = FK(angle, link)
            end_to_target = target - P[-1][:3, 3]
            err_end_to_target = math.sqrt(end_to_target[0] ** 2 + end_to_target[1] ** 2)
            if err_end_to_target < err_min:
                solved = True
            else:
                # Calculate distance between i-joint position to end effector position
                # P[i] is position of current joint
                # P[-1] is position of end effector
                cur_to_end = P[-1][:3, 3] - P[i][:3, 3]
                cur_to_end_mag = math.sqrt(cur_to_end[0] ** 2 + cur_to_end[1] ** 2)
                cur_to_target = target - P[i][:3, 3]
                cur_to_target_mag = math.sqrt(cur_to_target[0] ** 2 + cur_to_target[1] ** 2)

                end_target_mag = cur_to_end_mag * cur_to_target_mag

                if end_target_mag <= 0.0001:    
                    cos_rot_ang = 1
                    sin_rot_ang = 0
                else:
                    cos_rot_ang = (cur_to_end[0] * cur_to_target[0] + cur_to_end[1] * cur_to_target[1]) / end_target_mag
                    sin_rot_ang = (cur_to_end[0] * cur_to_target[1] - cur_to_end[1] * cur_to_target[0]) / end_target_mag

                rot_ang = math.acos(max(-1, min(1,cos_rot_ang)))

                if sin_rot_ang < 0.0:
                    rot_ang = -rot_ang

                # Update current joint angle values
                angle[i] = angle[i] + (rot_ang * 180 / math.pi)

                if angle[i] >= 360:
                    angle[i] = angle[i] - 360
                if angle[i] < 0:
                    angle[i] = 360 + angle[i]
                  
        if solved:
            break
            
    return angle, err_end_to_target, solved, loop


def drawExtras():
    # plot a blue shaded region to indicate first quadrant
    ax.fill([0, 3.5, 3.5, 0], [0, 0, 3.5, 3.5], 'b', alpha=0.2)
    # plot a red shaded region to indicate second quadrant
    ax.fill([0, -3.5, -3.5, 0], [0, 0, 3.5, 3.5], 'r', alpha=0.2)
    # plot a circular area
    ax.add_patch(plt.Circle((0, 0), sum(link), color='g', fill=True, alpha=0.2))
    # plot a yellow area to indicate restricted area
    ax.fill([pallet_x1, pallet_x2, pallet_x2, pallet_x1], [pallet_y1, pallet_y2, height, height], 'y', alpha=0.8)
    ax.fill([-width/2, width/2, width/2, -width/2], [-.75, -.75, -1, -1], 'y', alpha=1)

# Have not implemented
def onclick(event):
    global target, link, angle, ax
    target[0] = event.xdata
    target[1] = event.ydata

    # if target is in the second quadrant
    if target[0] < -width/2:
        #target[0] += 1
        target[1] -= 1
    else:
        #target[0] -= 1
        target[1] += 1
    
    print("Target Position : ", target)
    plt.cla()
    ax.set_xlim(-3.5, 3.5)
    ax.set_ylim(-3.5, 3.5)

    plt.grid(True)

    # Inverse Kinematics
    angle, err, solved, iteration = IK(target, angle, link, max_iter=1000)
    
    P = FK(angle, link)
    for i in range(len(link)):
        start_point = P[i]
        end_point = P[i+1]
        ax.plot([start_point[0,3], end_point[0,3]], [start_point[1,3], end_point[1,3]], linewidth=3)
        # draw_axis(ax, scale=5, A=P[i+1], draw_2d=True)

    drawExtras()

    if solved:
        # Plot a line from the last joint to the mouse click
        ax.plot([P[-1][0,3], event.xdata], [P[-1][1,3], event.ydata], 'g', linewidth=3)
        print("\nIK solved\n")
        print("Iteration :", iteration)
        print("Angle :", angle)
        print("Target :", target)
        print("End Effector :", P[-1][:3, 3])
        print("Error :", err)
    else:
        print("\nIK error\n")
        print("Angle :", angle)
        print("Target :", target)
        print("End Effector :", P[-1][:3, 3])
        print("Error :", err)

    # Draw clicked point
    ax.plot(event.xdata, event.ydata, 'ro')

    ax.set_aspect('equal', adjustable='box')
    
    # Update canvas
    fig.canvas.draw()

def main():
    global target

    fig.canvas.mpl_connect('button_press_event', onclick)
    fig.suptitle("Cyclic Coordinate Descent - Inverse Kinematics", fontsize=12)
    ax.set_xlim(-3.5, 3.5)
    ax.set_ylim(-3.5, 3.5)

    # Forward Kinematics
    P = FK(angle, link)
    # Plot Link
    for i in range(len(link)):
        start_point = P[i]
        end_point = P[i+1]
        ax.plot([start_point[0,3], end_point[0,3]], [start_point[1,3], end_point[1,3]], linewidth=3)
        # draw_axis(ax, scale=5, A=P[i+1], draw_2d=True)

    drawExtras()

    # Draw last joint on idle
    ax.plot([P[-1][0,3], 0], [P[-1][1,3], .32], 'g', linewidth=3)

    ax.set_aspect('equal', adjustable='box')

    plt.grid(True)
    plt.show()

if __name__ == "__main__":
    main()