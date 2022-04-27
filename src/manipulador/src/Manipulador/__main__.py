#!/usr/bin/env python3

import math
import time

from src.MotionCore import MotionCore
from src.Area import Area

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
        #self.pallet = Pallet(1.2, 1.1, 1)

    def fromIdleToWorspace(self):
        """
        Function that moves the robot along the contour of the pallet area
        """
        # get main points along pallet area
        points = self.palletArea.get_points2d(10)
        
        # move to every point with a small delay
        for point in points:
            # move to point
            self.motion.goToPosition([point[0], point[1], 0], 270)
            # wait for a while
            time.sleep(.3)
        

    def grab_box(self):
        """
        Rutine or function to grab a box, currently hardcoded
        """
        if self.motion.isInitialized:
            #self.motion.goToIdle() # only do if it is not already in idle state

            targetPlane = [1.12, -2.22, 0]
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

            self.motion.takeBox(targetPlane, targetZ, end, placeForBoxZ)
            #motion.goToPosition(end)


if __name__ == "__main__":
    manipulador = Manipulador()
    manipulador.motion.goToIdle(debug=True)
    input("Press Enter to start")
    manipulador.fromIdleToWorspace()
    manipulador.grab_box()
    #manipulador.motion.goToPosition([1.12, -2.22, 0])

    
    
    
