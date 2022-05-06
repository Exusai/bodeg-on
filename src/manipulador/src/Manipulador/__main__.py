#!/usr/bin/env python3
import math
import time
from turtle import pos
import rospy
from unity_msgs.msg import ArmTarget
from sensor_msgs.msg import CompressedImage
from matplotlib import pyplot as plt
import cv2 as cv
import numpy as np
import tensorflow as tf

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
        self.ready = False
        self.model = tf.keras.models.load_model('Manipulador/src/Models/modelTest.h5', compile = False)
        self.motion = MotionCore()
        #self.motion.goToIdle()

        self.sendTargetPosition = False # used for debuging

        if self.sendTargetPosition:
            TOPIC_NAME = 'target'
            #rospy.init_node(NODE_NAME, anonymous=True)
            self.pub = rospy.Publisher(TOPIC_NAME, ArmTarget, queue_size=2)

        DISTANCE_FROM_ORG_TO_PALLET = .32
        # Workspace point (from where the robot takes boxes)
        self.worspaceInitPoint = [DISTANCE_FROM_ORG_TO_PALLET +.5, .5, 0]

        # Offload point (where the starts the box placing)
        self.offloadPoint = [DISTANCE_FROM_ORG_TO_PALLET + .5, 1, 0]

        # Get interpolation points between pallet and offload point
        self.offLoadToWorkSpacePoints = self.motion.interpolateCoordinates(self.offloadPoint, self.worspaceInitPoint, 10)
        self.workSpaceToOffloadPoints = self.motion.interpolateCoordinates(self.worspaceInitPoint, self.offloadPoint, 10)
        
        # Representa los tipos u horientaciones de las caias en cada uno de los pisos del pallet
        # en este caso es el orden de las cajas de ricolino en el pallet (en el nivel inferior)
        boxArray = [Box(.40, .27, .27), Box(.40, .27, .27), Box(.27, .27, .40)]
        # idealmente esta cembiará cada vez que vaya por un nuevo producto 
        self.targetPallet = Pallet(1.2, 1, 4, boxArray)

        
        rospy.Subscriber("/gripper_cam/compressed", CompressedImage, self.callback_Vis)

        self.ready = True

    def callback_Vis(self, data_vis):
        im = np.frombuffer(data_vis.data, np.uint8)
        im = cv.imdecode(im, cv.IMREAD_UNCHANGED)

        # adjust gamma value of the image
        invGamma = 1.0 / 2.2
        table = np.array([((i / 255.0) ** invGamma) * 255
                          for i in np.arange(0, 256)]).astype("uint8")
        im = cv.LUT(im, table)

        self.DispImg = im.copy()

        # show image
        #cv.imshow("img", im)
        #cv.waitKey(1)

        im = tf.cast(im, tf.float32)
        im = (im/255)
        im = tf.expand_dims(im, axis=0)

        #print(im.shape)

        self.RecivedImage = im
        
    def get_pallet_position(self):
        """
        Function that runs inference on the model and returns the position of the pallet
        """
        cv.imshow("img", self.DispImg)
        cv.waitKey(1000) # 1s para ver img
        cv.destroyAllWindows()

        # run inference
        prediction = self.model.predict(self.RecivedImage)

        position = prediction[0][0:3]
        size = prediction[0][3:6]
        
        print("Estimated Postion (x,y,z):", position)
        print("Estimated Size (x,y,z):", size)

        return position, size



    """ def fromWS2Offload(self, suck):
        #Function that moves the robot along the contour of the pallet area
        
        # get main points along pallet area
        #points = self.palletArea.get_points2d(10)
        
        # move to every point with a small delay
        for point in self.workSpaceToOffloadPoints:
            # move to point
            self.motion.goToPosition([point[0], point[1], 0], 270, suck)
            # wait for a while
            time.sleep(.2)

    def fromOffload2WS(self, suck):
        #Function that moves the robot along the contour of the pallet area
        
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
            time.sleep(.2) """
        
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
            
    def grab_box_vertical(self, boxPosition, placeForBox, targetZ, placeForBoxZ):
        """
        Rutine or function to grab a box vertically
        """
        if self.motion.isInitialized:
            # offset boxPosition in x by -.94
            boxPosition[1] = boxPosition[1] + 1
            placeForBox[1] = placeForBox[1] + 1

            self.motion.takeBoxVertical(self.offloadPoint, boxPosition, targetZ)
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
                    placeForBoxY = box[1] -.43 # offset of the pallet 

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

    def grabFirstLevenBoxesVertically(self, palletOffset):
        s = 0
        leaveBoxLevel = len(self.targetPallet.gridStack)
        stack = self.targetPallet.gridStack[::-1][0]
        for row in stack[::-1]:
            for box in row:
                #print("Box coordinates", box)
                boxX = box[0] + palletOffset[0]
                boxY = box[1] + palletOffset[1] + .6

                placeForBoxX = box[0] + .228
                placeForBoxY = box[1] -.43 + .48 # offset of the pallet 

                boxPosition = [boxX, boxY, 0]
                placeForBox = [placeForBoxX, placeForBoxY, 0]

                # las cajas de ricolino miden .27 de alto entonces se bajan unos .10
                targetZ = - .15 -((.30 * s) + .18)
                #targetZ = -.10 + box.height * .5

                placeForBoxZ = leaveBoxLevel * -.27 + .25
                
                if self.sendTargetPosition:
                    targetVis = ArmTarget(boxX, boxY, targetZ, 0)
                    #targetVis = ArmTarget(placeForBoxX, placeForBoxY, placeForBoxZ, 0)
                    #targetVis = ArmTarget(box[0], box[1], targetZ, 0)
                    self.pub.publish(targetVis)
                
                self.grab_box_vertical(boxPosition, placeForBox, targetZ, placeForBoxZ)
                #input("Press Enter to continue...")


if __name__ == "__main__":
    manipulador = Manipulador()

    time.sleep(5) # esperaa cargar libs y todo eso antes de empezar

    print("***************************INICIALIZADO*****************************")
    input("Press Enter to start")
    #manipulador.motion.goToIdle()
    manipulador.motion.goToPosition(manipulador.offloadPoint, 270, 0)
    
    # El pallet tiene su origen en el centro de la tarima, pero para estimar posicion de las cajas el origen esta en su esquina inf izq
    offsetX = .228 # este se tanteo, pero es para que el origen quede en la parte de la izuqierda
    offsetY = -.5 # se le quita 50 cm para que el origen quede en la parte inferior

    input("Press Enter to run inference")
    estimatedPos, estimatedSize = manipulador.get_pallet_position()

    # el signo negativo es por que la distancia se mide de la cam hacia el pallet pero en sim el marco de referencia lo hace negativo
    posTarimaY = -estimatedPos[2] #-2
    posTarimaX = estimatedPos[0] #0 #.828001 -.45
    
    palletOffset = [offsetX + posTarimaX, offsetY + posTarimaY] # esta es una de las weas que la cámara debe medir

    # para tomar todas las cajas de arriba con las ventosas verticales
    #input("Press Enter to start routine")
    #manipulador.grabFirstLevenBoxesVertically(palletOffset)

    # Codigo para tomar todas las cajas
    input("Press Enter to start routine")
    manipulador.grabAllBoxesFromPallet(palletOffset)
    