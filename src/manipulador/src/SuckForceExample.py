#!/usr/bin/env python3

#init joy: rosrun joy joy_node 
import rospy
import rosgraph
import time
from unity_msgs.msg import GripperSuck
from sensor_msgs.msg import Joy


TOPIC_NAME = 'gripperSuck'
NODE_NAME = 'gripper_suck_publisher'

#define a variable to store the state of the gripper
#0 = no suck
#1 = suck 
state = False
suckForce = 0.0
a = 0

def suck_value():
    global state

    if a == 1:
        state = not state
        if state:
            print("Sucking")
        else:
            print("Not sucking")
    
    if state:
        suckForce = 1.0
    else:
        suckForce = 0.0

    suckForcePub = GripperSuck(suckForce)
    pub.publish(suckForcePub)

def joyReceiver(data):
    global a
    a = data.buttons[0]
    suck_value()

def wait_for_connections(pub, topic):
    ros_master = rosgraph.Master('/rostopic')
    topic = rosgraph.names.script_resolve_name('rostopic', topic)
    num_subs = 0
    for sub in ros_master.getSystemState()[1]:
        if sub[0] == topic:
            num_subs+=1

    for i in range(10):
        if pub.get_num_connections() == num_subs:
            return
        time.sleep(0.1)
    raise RuntimeError("failed to get publisher")


if __name__ == '__main__':
    print("Starting node " + NODE_NAME)
    print("init joy: rosrun joy joy_node ")
    print("Press A to suck")
    rospy.init_node(NODE_NAME, anonymous=True)
    pub = rospy.Publisher(TOPIC_NAME, GripperSuck, queue_size=2)
    wait_for_connections(pub, TOPIC_NAME)
    # Se subscribe al control (correr "rosrun joy joy_node")
    rospy.Subscriber("/joy", Joy, joyReceiver)
    rospy.spin()