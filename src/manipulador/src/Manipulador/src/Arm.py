import numpy as np
from . IKSolver import IKSolver
# La junta prismatica en z empieza en -.4303 y va hasta -1.5269
# Angulos del brazo completamente extendido:
# 179.98 (180)  target: 0
# 0.0           target: 0
# 359.99 (360)  target: 0

class Arm:
    def __init__(self):
        print("Initializing")
        self.stopped = False
        self.isIdle = True
        self.hasReachedIdle = False
        self.isFrozen = False
        self.isGrabbing = False
        self.fullKinematics = False
        
        # Lenght of the links of the arm
        self.E0Length = 1.1
        self.E1Length = 0.8
        self.E2Length = 1.5

        # Idle angle values (is initiated in idle position)
        self.alpha = np.radians(153.35) # target angle 26.60
        self.beta = np.radians(241.02)  # target angle 119.04
        self.gamma = np.radians(235.61) # target angle 124.35
        
        print("Initialized")

    
    def doSomething(self):
        print("Doing something")

    def emergencyStop(self):
        print("Emergency stop")
        self.stopped = True
        self.isIdle = False