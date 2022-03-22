#! /usr/bin/env python3

#init joy: rosrun joy joy_node 
from pickletools import float8
import rospy
from sensor_msgs.msg import Joy
from unity_msgs.msg import *

joyL = 0
joyR = 0
triggerR = 0
triggerL = 0
joyRFW = 0


def joyReceiver(data):
	global joyL, joyR, triggerL, triggerR, joyRFW
	joyL = data.axes[0]
	joyR = data.axes[3]
	triggerR = data.axes[5]
	triggerL = data.axes[2]
	joyRFW = data.axes[4]
	a = data.buttons[0]
	lb = data.buttons[4]
	lr = data.buttons[5]

	print("----------------------")
	print("joyL", joyL)
	print("joyLR", joyR)
	print("joyRFW", joyRFW)
	print("triggerR", triggerR)
	print("TriggerL", triggerL)
	print("a", a)
	print("lb", lb)
	print("lr", lr)
	#velPub.publish(float(joyRFW))


if __name__ == '__main__':
	print("Iniciando")
	rospy.init_node('control_manual', anonymous=False)

	# Se definen los publicadores
	velPub = rospy.Publisher('order_picker/speed', OrderPickerVelocity, queue_size=10)
	dirPub = rospy.Publisher('order_picker/direction', OrderPickerDirection, queue_size=10)
	camRotPub = rospy.Publisher('order_picker/camera_rotation', OrderPickerCameraRotation, queue_size=10)
	lifterPosPub = rospy.Publisher('order_picker/lifter_position', OrderPickerLifter, queue_size=10)

	# Se subscribe al control (correr "rosrun joy joy_node")
	rospy.Subscriber("/joy", Joy, joyReceiver)

	rospy.spin()