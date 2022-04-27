#!/usr/bin/env python3
import math
import time

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

        # Area of pallet (to be avoided if there are boxes on it)
        self.palletArea = Area(1.2, 1.4, [0, 1.4/2])
        self.palletContourPoints = self.palletArea.get_points2d(10)

        #get last point of pallet contour
        self.worspaceInitPoint = self.palletContourPoints[-1]
        
        # Representa los tipos u horientaciones de las caias en cada uno de los pisos del pallet
        # en este caso es el orden de las cajas de ricolino en el pallet (en el nivel inferior)
        boxArray = [Box(.40, .30, .30), Box(.40, .30, .30), Box(.30, .30, .40)]
        # idealmente esta cembiará cada vez que vaya por un nuevo producto 
        self.targetPallet = Pallet(1.2, 1, 4, boxArray)

    def fromIdleToWorkspace(self, suck):
        """
        Function that moves the robot along the contour of the pallet area
        """
        # get main points along pallet area
        #points = self.palletArea.get_points2d(10)
        
        # move to every point with a small delay
        for point in self.palletContourPoints:
            # move to point
            self.motion.goToPosition([point[0], point[1], 0], 270, suck)
            # wait for a while
            time.sleep(.3)

    def fromWorkspaceToIdle(self, suck):
        """
        Function that moves the robot along the contour of the pallet area
        """
        # get main points along pallet area
        #points = self.palletArea.get_points2d(10)
        
        # reverse points
        contourReversed = self.palletContourPoints.copy()
        contourReversed.reverse()

        # move to every point with a small delay
        for point in contourReversed:
            # move to point
            self.motion.goToPosition([point[0], point[1], 0], 270, suck)
            # wait for a while
            time.sleep(.3)
        

    def grab_box(self, boxPosition, placeForBox, targetZ, placeForBoxZ):
        """
        Rutine or function to grab a box
        """
        if self.motion.isInitialized:
            #self.motion.goToIdle() # only do if it is not already in idle state
            # offset boxPosition in x by -.94
            boxPosition[1] = boxPosition[1] + .94
            placeForBox[1] = placeForBox[1] + .94

            self.motion.takeBox(self.worspaceInitPoint, boxPosition, targetZ)
            self.fromWorkspaceToIdle(suck=1)
            self.motion.placeBox(self.palletContourPoints[0], placeForBox, placeForBoxZ)

    def grabAllBoxesFromPallet(self, palletOffset):
        s = 1
        leaveBoxLevel = len(self.targetPallet.gridStack)
        for stack in self.targetPallet.gridStack[::-1]:
            for row in stack[::-1]:
                for box in row:
                    #print("Box coordinates", box)
                    boxX = box[0] + palletOffset[0]
                    boxY = box[1] + palletOffset[1]

                    placeForBoxX = box[0]
                    placeForBoxY = box[1]-.30/2-.5# offset of the pallet 

                    boxPosition = [boxX, boxY, 0]
                    placeForBox = [placeForBoxX, placeForBoxY, 0]

                    # las cajas de ricolino miden .27 de alto entonces se bajan unos .10
                    targetZ = -(.30/2 * s)
                    #targetZ = -.10 + box.height * .5
                    
                    placeForBoxZ = leaveBoxLevel * -.27 + .25
                    
                    self.fromIdleToWorkspace(suck=0)
                    self.grab_box(boxPosition, placeForBox, targetZ, placeForBoxZ)
            s += 1
            leaveBoxLevel -= 1

if __name__ == "__main__":
    manipulador = Manipulador()

    input("Press Enter to start")
    manipulador.motion.goToIdle()
    input("Press Enter to start routine")
    palletOffset = [0, -2.5 - 1+.27] # esta es una de las weas que la cámara debe medir
    manipulador.grabAllBoxesFromPallet(palletOffset)
    
    #manipulador.fromWorkspaceToIdle(suck=0)
    
    #manipulador.motion.goToPosition([1.12, -2.22, 0])