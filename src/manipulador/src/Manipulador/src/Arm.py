from IKSolver import CyclicCoordinateDescentInverseKinematics


class Arm:
    def __init__(self, links, initAngles):
        self.links = links
        self.ikSolver = CyclicCoordinateDescentInverseKinematics(links, initAngles)

    def solveForTarget(self, target):
        angle, err, solved, iteration = arm.ikSolver.IK(target)
        P = arm.ikSolver.FK()
        return P, angle, err, solved, iteration
        

if __name__ == "__main__":
    arm = Arm([1.1, 0.8], [26.60 + 90, 119])
    target = [1, 1, 0]
    P, angle, err, solved, iteration = arm.solveForTarget(target)
    
    if solved:
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

    #print(arm.ikSolver.link)
    #print(arm.ikSolver.angle)