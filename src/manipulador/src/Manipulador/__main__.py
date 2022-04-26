#!/usr/bin/env python3

import math

from src.MotionCore import MotionCore

if __name__ == "__main__":
    motion = MotionCore()

    if motion.isInitialized:
        #motion.goToIdle() # only do if it is not already in idle state

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

        motion.takeBox(targetPlane, targetZ, end, placeForBoxZ)
        #motion.goToPosition(end)
    
    
