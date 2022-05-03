#!/usr/bin/env python3
import math
import time
import rospy
from unity_msgs.msg import ArmTarget

from matplotlib import pyplot as plt

from src.MotionCore import MotionCore
from src.Area import Area
from src.Box import Box
from src.PalletLoad import Pallet

"""
Para todas las coordenadas que se usan aqui, unity usa z como el eje vertical, x como el eje horizontal.
Estos programas funcinan bien con este sistema de coordenadas insertandolas como [x, z] y se corresponden 
con la vista superior en unity.
"""

class Manipulador():
    def __init__(self):
        self.motion = MotionCore()
        #self.motion.goToIdle()

        self.sendTargetPosition = True # used for debuging

        if self.sendTargetPosition:
            TOPIC_NAME = 'target'
            #rospy.init_node(NODE_NAME, anonymous=True)
            self.pub = rospy.Publisher(TOPIC_NAME, ArmTarget, queue_size=2)


        # Workspace point (from where the robot takes boxes)
        self.worspaceInitPoint = [.32+.5, .5, 0]

        # Offload point (where the starts the box placing)
        self.offloadPoint = [.32+.5, 1, 0]

        # Get interpolation points between pallet and offload point
        self.offLoadToWorkSpacePoints = self.motion.interpolateCoordinates(self.offloadPoint, self.worspaceInitPoint, 10)
        self.workSpaceToOffloadPoints = self.motion.interpolateCoordinates(self.worspaceInitPoint, self.offloadPoint, 10)
        
        # Representa los tipos u horientaciones de las caias en cada uno de los pisos del pallet
        # en este caso es el orden de las cajas de ricolino en el pallet (en el nivel inferior)
        boxArray = [Box(.40, .27, .27), Box(.40, .27, .27), Box(.27, .27, .40)]
        # idealmente esta cembiará cada vez que vaya por un nuevo producto 
        self.targetPallet = Pallet(1.2, 1, 4, boxArray)

    def fromWS2Offload(self, suck):
        """
        Function that moves the robot along the contour of the pallet area
        """
        # get main points along pallet area
        #points = self.palletArea.get_points2d(10)
        
        # move to every point with a small delay
        for point in self.workSpaceToOffloadPoints:
            # move to point
            self.motion.goToPosition([point[0], point[1], 0], 270, suck)
            # wait for a while
            time.sleep(.2)

    def fromOffload2WS(self, suck):
        """
        Function that moves the robot along the contour of the pallet area
        """
        # get main points along pallet area
        #points = self.palletArea.get_points2d(10)
        
        # reverse points
        #contourReversed = self.palletContourPoints.copy()
        #contourReversed.reverse()

        # move to every point with a small delay
        for point in self.offLoadToWorkSpacePoints:
            # move to point
            self.motion.goToPosition([point[0], point[1], 0], 270, suck)
            # wait for a while
            time.sleep(.2)
        
    def grab_box(self, boxPosition, placeForBox, targetZ, placeForBoxZ):
        """
        Rutine or function to grab a box
        """
        if self.motion.isInitialized:
            # offset boxPosition in x by -.94
            boxPosition[1] = boxPosition[1] + 1
            placeForBox[1] = placeForBox[1] + 1

            self.motion.takeBox(self.offloadPoint, boxPosition, targetZ)
            #self.fromWS2Offload(suck=1)
            self.motion.placeBox(self.offloadPoint, placeForBox, placeForBoxZ)

    def grabAllBoxesFromPallet(self, palletOffset):
        s = 0
        leaveBoxLevel = len(self.targetPallet.gridStack)
        for stack in self.targetPallet.gridStack[::-1]:
            for row in stack[::-1]:
                for box in row:
                    #print("Box coordinates", box)
                    boxX = box[0] + palletOffset[0]
                    boxY = box[1] + palletOffset[1]

                    placeForBoxX = box[0] + .228
                    placeForBoxY = box[1] -.5 # offset of the pallet 

                    boxPosition = [boxX, boxY, 0]
                    placeForBox = [placeForBoxX, placeForBoxY, 0]

                    # las cajas de ricolino miden .27 de alto entonces se bajan unos .10
                    targetZ = - .15 -((.30 * s) + .25)
                    #targetZ = -.10 + box.height * .5

                    placeForBoxZ = leaveBoxLevel * -.27 + .25
                    
                    if self.sendTargetPosition:
                        targetVis = ArmTarget(boxX, boxY, targetZ, 0)
                        #targetVis = ArmTarget(placeForBoxX, placeForBoxY, placeForBoxZ, 0)
                        #targetVis = ArmTarget(box[0], box[1], targetZ, 0)
                        self.pub.publish(targetVis)

                    #self.fromOffload2WS(suck=0)
                    self.grab_box(boxPosition, placeForBox, targetZ, placeForBoxZ)

                    #input("Press Enter to continue...")
            s += 1
            leaveBoxLevel -= 1

if __name__ == "__main__":
    manipulador = Manipulador()

    input("Press Enter to start")
    manipulador.motion.goToIdle()
    manipulador.motion.goToPosition(manipulador.offloadPoint, 270, 0)
    #manipulador.motion.goToPosition(manipulador.worspaceInitPoint, 270, 0)
    input("Press Enter to start routine")
    palletOffset = [.228, -2] # esta es una de las weas que la cámara debe medir
    manipulador.grabAllBoxesFromPallet(palletOffset)
    