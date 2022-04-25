import sys
from src.Arm import Arm

if __name__ == "__main__":
    arm = Arm()
    while not arm.stopped:
        arm.doSomething()
