#!/usr/bin/env python3
from crypt import methods
import io
import math
import time
import rospy
from unity_msgs.msg import ArmTarget
from sensor_msgs.msg import CompressedImage
from matplotlib import pyplot as plt
import cv2 as cv
import numpy as np
import tensorflow as tf

from flask import Flask, send_file, request

from src.MotionCore import MotionCore
from src.Area import Area
from src.Box import Box
from src.PalletLoad import Pallet

app = Flask(__name__)

"""
Para todas las coordenadas que se usan aqui, unity usa z como el eje vertical, x como el eje horizontal.
Estos programas funcinan bien con este sistema de coordenadas insertandolas como [x, z] y se corresponden 
con la vista superior en unity.
"""

class Manipulador():
    def __init__(self):
        self.ready = False
        self.model = tf.keras.models.load_model('Manipulador/src/Models/PalletPoseEstimationv3.h5', compile = False)
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

        # offset de place for box, se midieron en simulacion
        self.offsetPlaceForBoxX = .228
        self.offsetPlaceForBoxY = .43

        # pallet offsets for pose estimation
        # El pallet tiene su origen en el centro de la tarima, pero para estimar posicion de las cajas el origen esta en su esquina inf izq
        self.offsetX = .228 # este se tanteo, pero es para que el origen quede en la parte de la izuqierda
        self.offsetY = -.5 # se le quita 50 cm para que el origen quede en la parte inferior

        # posición de la tarima (después se estimará)
        self.posTarimaY = -2
        self.posTarimaX = 0

        # variable que se le pasa a las funciones para empezar a tomar cajas
        self.palletOffset = [self.offsetX + self.posTarimaX, self.offsetY + self.posTarimaY]

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
        # convert from bgr to rgb
        im = cv.cvtColor(im, cv.COLOR_BGR2RGB)
        im = tf.cast(im, tf.float32)
        im = (im/255)
        im = tf.expand_dims(im, axis=0)
        
        self.RecivedImage = im
        
    def get_pallet_position(self):
        """
        Function that runs inference on the model and returns the position of the pallet
        """
        #cv.imshow("img", self.DispImg)
        #cv.waitKey(1000) # 1s para ver img
        #cv.destroyAllWindows()

        # run inference
        prediction = self.model.predict(self.RecivedImage)

        position = prediction[0][0:3]

        # el signo negativo es por que la distancia se mide de la cam hacia el pallet pero en sim el marco de referencia lo hace negativo
        self.posTarimaY = -position[2]
        self.posTarimaX = position[0]
        
        self.palletOffset = [self.offsetX + self.posTarimaX, self.offsetY + self.posTarimaY]
        
        print("Estimated Postion (x,y,z):", position)

        return position

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

    def grabAllBoxesFromPallet(self):
        s = 0
        leaveBoxLevel = len(self.targetPallet.gridStack)
        for stack in self.targetPallet.gridStack[::-1]:
            for row in stack[::-1]:
                for box in row:
                    #print("Box coordinates", box)
                    boxX = box[0] + self.palletOffset[0]
                    boxY = box[1] + self.palletOffset[1]

                    placeForBoxX = box[0] + self.offsetPlaceForBoxX
                    placeForBoxY = box[1] - self.offsetPlaceForBoxY # offset of the pallet 

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
            if s == 2: break

    def grabFirstLevelBoxesVertically(self):
        s = 0
        leaveBoxLevel = len(self.targetPallet.gridStack)
        stack = self.targetPallet.gridStack[::-1][0]
        for row in stack[::-1]:
            for box in row:
                #print("Box coordinates", box)
                boxX = box[0] + self.palletOffset[0]
                boxY = box[1] + self.palletOffset[1] + .6 # este último es para que el brazo baje un poco y use ventosas verticales

                placeForBoxX = box[0] + self.offsetPlaceForBoxX
                placeForBoxY = box[1] - self.offsetPlaceForBoxY + .48 # este último es el offset del brazo para tomar con ventosas verticales

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

    def grabNboxesFromPallet(self, n, horizontal):
        s = 0
        leaveBoxLevel = len(self.targetPallet.gridStack)
        takenBoxes = 0
        stack = self.targetPallet.gridStack[::-1][0]
        for row in stack[::-1]:
            for box in row:
                boxX = box[0] + self.palletOffset[0]

                placeForBoxX = box[0] + self.offsetPlaceForBoxX

                if horizontal:
                    boxY = box[1] + self.palletOffset[1]
                    placeForBoxY = box[1] - self.offsetPlaceForBoxY
                    targetZ = - .15 -((.30 * s) + .25)
                else:
                    boxY = box[1] + self.palletOffset[1] + .5
                    placeForBoxY = box[1] - self.offsetPlaceForBoxY + .48
                    targetZ = - .15 -((.30 * s) + .18)
                
                boxPosition = [boxX, boxY, 0]
                placeForBox = [placeForBoxX, placeForBoxY, 0]
                placeForBoxZ = leaveBoxLevel * -.27 + .25

                if horizontal:
                    self.grab_box(boxPosition, placeForBox, targetZ, placeForBoxZ)
                else:
                    self.grab_box_vertical(boxPosition, placeForBox, targetZ, placeForBoxZ)
                
                takenBoxes += 1
                if takenBoxes == n:
                    return

# ============================================================================== #
# Server Code                                                                    #
# ============================================================================== #
manipulador = Manipulador()

@app.route('/')
def index():
    return "Robot endpoint"

@app.route('/goToOffloadPoint', methods=['POST'])
def goToOffloadPoint():
    manipulador.motion.goToPosition(manipulador.offloadPoint, 270, 0)
    time.sleep(5)
    return "Posición de inicio y descarga alcanzada"

@app.route('/estimatePosition', methods=['POST'])
def estimatePalletPostion():
    estimatedPos = manipulador.get_pallet_position()
    return "Posición de la tarima estimada: \n" + str(estimatedPos)

@app.route('/takeBoxesVert', methods=['POST'])
def takeBoxesVert():
    manipulador.grabFirstLevelBoxesVertically()
    return "Primer Nivel de cajas tomadas"

@app.route('/takeBoxesHoriz', methods=['POST'])
def takeBoxesHoriz():
    manipulador.grabAllBoxesFromPallet()
    return "Tomadas todas las cajas posibles"

@app.route('/take', methods=['POST'])
def take():
    numberOfBoxesToTake = request.args.get('n')
    horizontalSucker = request.args.get('horizontal')

    print("Taking", numberOfBoxesToTake, "boxes")
    print("Horizontal:", horizontalSucker)

    if horizontalSucker == "true":
        horizontalSucker = True
    else:
        horizontalSucker = False
    
    numberOfBoxesToTake = int(numberOfBoxesToTake)

    manipulador.grabNboxesFromPallet(numberOfBoxesToTake, horizontalSucker)
    return "Tomadas " + str(numberOfBoxesToTake) + " cajas"

@app.route('/getPalletDist', methods=['get'])
def getPalletdist():
    # TODO: change pallet box type
    img = manipulador.targetPallet.pallet_plot()
    img.seek(0)
    return send_file(img, mimetype='image/png')
# ============================================================================== #
# Server Code End                                                                #
# ============================================================================== #

if __name__ == "__main__":
    print("***************************INICIALIZADO*****************************")
    app.run(host='0.0.0.0', debug=True, port=5000)