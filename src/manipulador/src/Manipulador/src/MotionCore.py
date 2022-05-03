import time
import rospy
from unity_msgs.msg import ArmPose

from . Arm import Arm

class MotionCore:
    def __init__(self):
        print("Initializing Motion Core")
        self.isInitialized = False

        self.fullMotion = False
        
        # Lenght of the links of the arm
        self.E0Length = 1.1
        self.E1Length = 0.9
        self.E2Length = 1
        
        # Idle angles of the arm
        self.alpha = 0
        self.beta = 132
        self.gamma = 137.5

        if self.fullMotion == False:
            idleAngles = [self.alpha, self.beta]
            self.virtualArm = Arm([self.E0Length, self.E1Length], idleAngles)
        else:
            idleAngles = [self.alpha, self.beta, self.gamma]
            self.virtualArm = Arm([self.E0Length, self.E1Length, self.E2Length], idleAngles)

        rospy.init_node('arm_target_pose_pub', anonymous=True)
        self.posePub = rospy.Publisher('arm_pose_target', ArmPose, queue_size=3)

        self.isInitialized = True
        print("Initialized Motion Core")

    def lastLinkAngle(self, desiredAngle):
        """
        It is used to calculate required angle to reach the target at a 90 degree angle (or desired angle)
        """
        return  - self.virtualArm.ikSolver.angle[0] - self.virtualArm.ikSolver.angle[1] + desiredAngle

    def interpolateCoordinates(self, currentPos, targetPos, steps, linear = False):
        """
        Interpolates from current position to target position in the given number of steps 
        and saves the intermediate positions in a list
        """
        points = []
        deltaX = (targetPos[0] - currentPos[0]) / steps
        deltaY = (targetPos[1] - currentPos[1]) / steps

        if linear:
            for i in range(steps):
                i = i + 1
                points.append([currentPos[0], currentPos[1] + deltaY * i, 0])
            for i in range(steps):
                i = i + 1
                points.append([currentPos[0] + deltaX * i, currentPos[1] + deltaY * steps, 0])
        else:
            for i in range(steps):
                i = i + 1
                points.append([currentPos[0] + i * deltaX, currentPos[1] + i * deltaY, 0])

        return points

    def performInterpolation(self, interpolation, sleepTime, target, suck, z, debug):
        for point in interpolation:
            P, self.virtualArm.ikSolver.angle, err, solved, iteration = self.virtualArm.solveForTarget(point)
            targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], self.lastLinkAngle(270), z, 0, suck)
            self.posePub.publish(targetPose)
            

            if solved:
                if debug:
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

            time.sleep(sleepTime)

    def goToIdle(self, debug=False):
        """
        puts arm in idle position inmediately
        """
        if debug: input("Enter to go to idle")
        targetPose = ArmPose(self.alpha, self.beta, self.gamma, 0, 0, 0)
        self.posePub.publish(targetPose)

    def goToPosition(self, position, lastLinkAngle, suck, debug=False):
        """
        puts arm in desired position inmediately
        """
        P, self.virtualArm.ikSolver.angle, err, solved, iteration = self.virtualArm.solveForTarget(position)

        if debug: input("Enter to move to target")
        #targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], lastLinkAngle, 0, 0, 0)
        targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], self.lastLinkAngle(lastLinkAngle), 0, 0, suck)
        self.posePub.publish(targetPose)
        
    
    def takeBox(self, workSpaceInit, target, targetZ, steps=10, debug=False, sleepTime=.2):
        """
        Takes a box from the pallet and places it in the desired position
        currently used for testing and it is hardcoded
        """

        if debug: input("Enter to move to target")

        # lineal interpolation from current position to target position and save it in a list
        interpolation = self.interpolateCoordinates(workSpaceInit, target, steps)

        self.performInterpolation(interpolation, sleepTime, target, 0, 0, debug)

        time.sleep(7)
        # slowly go from placeForBoxZ to 0
        for i in range(0, steps):
            targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], self.lastLinkAngle(270), (targetZ/steps)*(i+1), 0, 1)
            self.posePub.publish(targetPose)
            time.sleep(sleepTime)

        time.sleep(1)

        if debug: input("Enter to lift")
        targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], self.lastLinkAngle(270), 0, 0, 1)
        self.posePub.publish(targetPose)
        
        time.sleep(1)

        if debug: input("Press Enter to move to workSpaceInit")
        interpolation = self.interpolateCoordinates(target, workSpaceInit, steps, linear=True)

        self.performInterpolation(interpolation, sleepTime, target, 1, 0, debug)

        print("BoxTaken")

    def placeBox(self, workSpaceInit, placeForBox, placeForBoxZ, steps=10, debug=False, sleepTime=.2):
        # lineal interpolation from current position to target position and save it in a list
        interpolation = self.interpolateCoordinates(workSpaceInit, placeForBox, steps, linear=True)

        self.performInterpolation(interpolation, sleepTime, placeForBox, 1, 0, debug)
            
        if debug: input("Enter to go down")
        # Solowly go from 0 to placeForBoxZ
        for i in range(0, steps):
            targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], self.lastLinkAngle(270), (placeForBoxZ/steps)*(i+1), 0, 1)
            self.posePub.publish(targetPose)
            time.sleep(sleepTime)

        time.sleep(.5)

        if debug: input("Enter to drop box")
        targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], self.lastLinkAngle(270), placeForBoxZ, 0, 0)
        self.posePub.publish(targetPose)

        time.sleep(.5)

        # slowly go from placeForBoxZ to 0
        interpolation = self.interpolateCoordinates(placeForBox, workSpaceInit, steps)
        for i in range (0, steps):
            targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], self.lastLinkAngle(270), (placeForBoxZ/steps)*(steps-i), 0, 0)
            self.posePub.publish(targetPose)
            time.sleep(sleepTime)

        for i, point in enumerate(interpolation):
            P, self.virtualArm.ikSolver.angle, err, solved, iteration = self.virtualArm.solveForTarget(point)
            targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], self.lastLinkAngle(270), 0, 0, 0)
            self.posePub.publish(targetPose)
            time.sleep(sleepTime)

        #targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], self.lastLinkAngle(270), 0, 0, 0)
        #self.posePub.publish(targetPose) 

        #time.sleep(2)

        #self.goToIdle()

    def takeBoxVertical(self, workSpaceInit, target, targetZ, steps=10, debug=False, sleepTime=.2):
        """
        Takes a box from the pallet and places it in the desired position
        using the vertical suckers
        """

        if debug: input("Enter to move to target")

        # lineal interpolation from current position to target position and save it in a list
        interpolation = self.interpolateCoordinates(workSpaceInit, target, steps)
        self.performInterpolation(interpolation, sleepTime, target, 0, 0, debug)

        targetPose = ArmPose(self.virtualArm.ikSolver.angle[0], self.virtualArm.ikSolver.angle[1], self.lastLinkAngle(270), targetZ, 0, 0)
        self.posePub.publish(targetPose)

        time.sleep(5)
        
        interpolation = self.interpolateCoordinates(target, [target[0], target[1] - .1], steps)
        self.performInterpolation(interpolation, sleepTime, target, 0, targetZ, debug)

        
        time.sleep(1)

        if debug: input("Press Enter to move to workSpaceInit")
        interpolation = self.interpolateCoordinates(target, workSpaceInit, steps, linear=True)

        self.performInterpolation(interpolation, sleepTime, target, 1, targetZ,debug)

        print("BoxTaken")


