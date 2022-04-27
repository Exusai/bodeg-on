import rospy
from unity_msgs.msg import ArmPose

from . Arm import Arm

class MotionCore:
    def __init__(self):
        print("Initializing")
        self.isInitialized = False

        self.fullMotion = False
        
        # Lenght of the links of the arm
        self.E0Length = 1.1
        self.E1Length = 0.8
        self.E2Length = .94

        self.alpha = 16
        self.beta = 140
        self.gamma = 113

        if self.fullMotion == False:
            idleAngles = [self.alpha, self.beta]
            self.virtualArm = Arm([self.E0Length, self.E1Length], idleAngles)
        else:
            idleAngles = [self.alpha, self.beta, self.gamma]
            self.virtualArm = Arm([self.E0Length, self.E1Length, self.E2Length], idleAngles)

        rospy.init_node('arm_target_pose_pub', anonymous=True)
        self.posePub = rospy.Publisher('arm_pose_target', ArmPose, queue_size=3)

        self.isInitialized = True
        print("Initialized")

    def lastLinkAngle(self, desiredAngle):
        """
        It is used to calculate required angle to reach the target at a 90 degree angle (or desired angle)
        """
        return  - self.virtualArm.ikSolver.angle[0] - self.virtualArm.ikSolver.angle[1] + desiredAngle

    def goToIdle(self, debug=False):
        """
        puts arm in idle position inmediately
        """
        if debug: input("Enter to go to idle")
        targetPose = ArmPose(16.5, 140, 113, 0, 0, 0)
        self.posePub.publish(targetPose)

    def goToPosition(self, position, lastLinkAngle,debug=False):
        """
        puts arm in desired position inmediately
        """
        P, self.virtualArm.ikSolver.angle, err, solved, iteration = self.virtualArm.solveForTarget(position)

        if debug: input("Enter to move to target")
        #targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], lastLinkAngle, 0, 0, 0)
        targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], self.lastLinkAngle(lastLinkAngle), 0, 0, 0)
        self.posePub.publish(targetPose)
        
    
    def takeBox(self, target, targetZ, placeForBox, placeForBoxZ):
        """
        Takes a box from the pallet and places it in the desired position
        currently used for testing and it is hardcoded
        """
        #print("Moving to target")
        P, self.virtualArm.ikSolver.angle, err, solved, iteration = self.virtualArm.solveForTarget(target)

        input("Enter to move to target")
        targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], self.lastLinkAngle(270), 0, 0, 0)
        self.posePub.publish(targetPose)

        if solved:
            print("\nIK solved\n")
            print("Iteration :", iteration)
            print("Angle :", self.virtualArm.ikSolver.angle)
            print("Target :", target)
            print("End Effector :", P[-1][:3, 3])
            print("Error :", err)
        else:
            print("\nIK error\n")
            print("Angle :", self.virtualArm.ikSolver.angle)
            print("Target :", target)
            print("End Effector :", P[-1][:3, 3])
            print("Error :", err)

        # wait for keypress
        input("Enter to move grab target")
        targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], self.lastLinkAngle(270), targetZ, 0, 1)
        self.posePub.publish(targetPose)

        input("Enter to lift")
        targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], self.lastLinkAngle(270), 0, 0, 1)
        self.posePub.publish(targetPose)

        input("Press Enter to move to box place")
        #print("Moving to place")
        P, self.virtualArm.ikSolver.angle, err, solved, iteration = self.virtualArm.solveForTarget(placeForBox)

        if solved:
            print("\nIK solved\n")
            print("Iteration :", iteration)
            print("Angle :", self.virtualArm.ikSolver.angle)
            print("Target :", target)
            print("End Effector :", P[-1][:3, 3])
            print("Error :", err)
        else:
            print("\nIK error\n")
            print("Angle :", self.virtualArm.ikSolver.angle)
            print("Target :", target)
            print("End Effector :", P[-1][:3, 3])
            print("Error :", err)

        targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], self.lastLinkAngle(270), 0, 0, 1)
        self.posePub.publish(targetPose)

        input("Enter to go down")
        targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], self.lastLinkAngle(270), placeForBoxZ, 0, 1)
        self.posePub.publish(targetPose)

        input("Enter to drop box")
        targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], self.lastLinkAngle(270), placeForBoxZ, 0, 0)
        self.posePub.publish(targetPose)

        targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], self.lastLinkAngle(270), 0, 0, 0)
        self.posePub.publish(targetPose)

        print("Finished")


