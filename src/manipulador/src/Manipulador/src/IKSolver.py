import numpy as np
import math

class CyclicCoordinateDescentInverseKinematics:
    def __init__(self, link, angle, max_iter=1000, err_min=0.01):
        self.max_iter = max_iter
        self.err_min = err_min
        self.target = [0, 0, 0]

        # Robot Initial Joint Values (degree)
        #self.angle = [0, 0]
        self.angle = angle

        # Robot Link Length Parameter
        #self.link = [1.1, 0.8]
        self.link = link

    def rotateZ(self, theta):
        rz = np.array([[math.cos(theta), - math.sin(theta), 0, 0],
                    [math.sin(theta), math.cos(theta), 0, 0],
                    [0, 0, 1, 0],
                    [0, 0, 0, 1]])
        return rz

    def translate(self, dx, dy, dz):
        t = np.array([[1, 0, 0, dx],
                    [0, 1, 0, dy],
                    [0, 0, 1, dz],
                    [0, 0, 0, 1]])
        return t

    # Forward Kinematics
    # Input initial angles and length of links
    # Output positions each points
    def FK(self):
        n_links = len(self.link)
        P = []
        P.append(np.eye(4))
        for i in range(0, n_links):
            R = self.rotateZ(self.angle[i]/180*math.pi)
            T = self.translate(self.link[i], 0, 0)
            P.append(P[-1].dot(R).dot(T))
        return P

    def IK(self, target):
        solved = False
        err_end_to_target = math.inf
        
        for loop in range(self.max_iter):
            for i in range(len(self.link)-1, -1, -1):
                P = self.FK()
                end_to_target = target - P[-1][:3, 3]
                err_end_to_target = math.sqrt(end_to_target[0] ** 2 + end_to_target[1] ** 2)
                if err_end_to_target < self.err_min:
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
                    self.angle[i] = self.angle[i] + (rot_ang * 180 / math.pi)

                    if self.angle[i] >= 360:
                        self.angle[i] = self.angle[i] - 360
                    if self.angle[i] < 0:
                        self.angle[i] = 360 + self.angle[i]
                    
            if solved:
                break
                
        return self.angle, err_end_to_target, solved, loop