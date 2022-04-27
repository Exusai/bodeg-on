#!/usr/bin/env python3
import math
import time

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
        self.palletArea = Area(1.1, 1.3, [0, 1.3/2])
        self.palletContourPoints = self.palletArea.get_points2d(10)

        #get last point of pallet contour
        self.worspaceInitPoint = self.palletContourPoints[-1]
        
        # Representa los tipos u horientaciones de las caias en cada uno de los pisos del pallet
        # en este caso es el orden de las cajas de ricolino en el pallet (en el nivel inferior)
        boxArray = [Box(.40, .27, .27), Box(.40, .27, .27), Box(.27, .27, .40)]
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
        

    #def grab_box(self, boxPosition, placeForBox, boxPositionZ, placeForBoxZ):
    def grab_box(self):
        """
        Rutine or function to grab a box
        """
        if self.motion.isInitialized:
            #self.motion.goToIdle() # only do if it is not already in idle state

            targetPlane = [1.2, -2.25, 0]
            #targetPlane = [.5, -2.22, 0]

            end = [.5, 0, 0]

            # Para la primerca caja bajar -.20m
            targetZ = -.20

            # para la primer caja dejar a -.8m
            placeForBoxZ = -.8

            # offset targetPlane in x by -.94
            targetPlane[1] = targetPlane[1] + .94
            end[1] = end[1] + .94

            # rotate targetPlane by -90 degrees
            #targetPlane[0] = targetPlane[0] * math.cos(math.radians(-90)) - targetPlane[1] * math.sin(math.radians(-90))
            #targetPlane[1] = targetPlane[0] * math.sin(math.radians(-90)) + targetPlane[1] * math.cos(math.radians(-90))

            # rotate end by -90 degrees
            #end[0] = end[0] * math.cos(math.radians(-90)) - end[1] * math.sin(math.radians(-90))
            #end[1] = end[0] * math.sin(math.radians(-90)) + end[1] * math.cos(math.radians(-90))

            self.motion.takeBox(self.worspaceInitPoint, targetPlane, targetZ)
            manipulador.fromWorkspaceToIdle(suck=1)
            self.motion.placeBox(self.palletContourPoints[0], end, placeForBoxZ)
            #self.motion.placeBox([.1,.5,0], end, placeForBoxZ)
            #motion.goToPosition(end)


if __name__ == "__main__":
    manipulador = Manipulador()
    manipulador.motion.goToIdle(debug=True)
    input("Press Enter to start")
    
    
    manipulador.fromIdleToWorkspace(suck=0)
    manipulador.grab_box()
    #manipulador.fromWorkspaceToIdle(suck=0)
    
    #manipulador.motion.goToPosition([1.12, -2.22, 0])