#! /usr/bin/env python3

#init joy: rosrun joy joy_node 
from pickletools import float8
import rospy
from sensor_msgs.msg import Joy
from unity_msgs.msg import *

""" joyL = 0
joyR = 0
triggerR = 0
triggerL = 0
joyRFW = 0
"""
cameraAngle = 0
orderpickerVel = 0
orderpickerDir = 0
orderpickerLifter = 0

def clamp(n, smallest, largest): return max(smallest, min(n, largest))

def joyReceiver(data):
	global cameraAngle, orderpickerVel, orderpickerDir, orderpickerLifter

	joyL = data.axes[0]
	joyR = data.axes[3]
	triggerR = -(data.axes[5] -1)/10
	triggerL = (data.axes[2] -1)/10
	joyRFW = data.axes[4]
	a = data.buttons[0]
	lb = data.buttons[4]
	lr = data.buttons[5]

	cameraAngle = -joyR
	orderpickerVel = -joyRFW
	orderpickerDir = -joyL
	orderpickerLifter += triggerL 
	orderpickerLifter += triggerR 
	orderpickerLifter = clamp(orderpickerLifter, 0, 2.3)

	velPub.publish(float(orderpickerVel))
	dirPub.publish(float(orderpickerDir))
	camRotPub.publish(float(cameraAngle))
	lifterPosPub.publish(float(orderpickerLifter))

	print("----------------------")
	print(cameraAngle)
	print(orderpickerVel)
	print(orderpickerDir)
	print(orderpickerLifter)
	""" print("joyL", joyL)
	print("joyLR", joyR)
	print("joyRFW", joyRFW)
	print("triggerR", triggerR)
	print("TriggerL", triggerL)
	print("a", a)
	print("lb", lb)
	print("lr", lr) """


if __name__ == '__main__':
	print("Listo")
	rospy.init_node('control_manual', anonymous=False)

	# Se definen los publicadores
	velPub = rospy.Publisher('order_picker/speed', OrderPickerVelocity, queue_size=2)
	dirPub = rospy.Publisher('order_picker/direction', OrderPickerDirection, queue_size=2)
	camRotPub = rospy.Publisher('order_picker/camera_rotation', OrderPickerCameraRotation, queue_size=2)
	lifterPosPub = rospy.Publisher('order_picker/lifter_position', OrderPickerLifter, queue_size=3)

	# Se subscribe al control (correr "rosrun joy joy_node")
	rospy.Subscriber("/joy", Joy, joyReceiver)

	rospy.spin()