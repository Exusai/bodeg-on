#!/usr/bin/env python3

import rospy
import rosgraph
import time
from unity_msgs.msg import ArmTarget
import numpy as np


TOPIC_NAME = 'target'
NODE_NAME = 'target_publisher'

# Para iterar y hacer un circulo
c = 0

def post_target():
    # Estos valores esta con respecto al origen del brazo
    global c
    xCircle = 1.5
    yCircle = -1

    theta = c / 3.1416
    
    x = .5 * np.cos(theta) + xCircle
    y = .5 * np.sin(theta) + yCircle
    
    z = -.5
    grabAngle = 0
    
    target = ArmTarget(x, y, z, grabAngle)
    pub.publish(target)
    c += .2
    time.sleep(0.1)


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
    try:
        rospy.init_node(NODE_NAME, anonymous=True)
        pub = rospy.Publisher(TOPIC_NAME, ArmTarget, queue_size=2)
        wait_for_connections(pub, TOPIC_NAME)

        r = rospy.Rate(10) # 10hz
        while not rospy.is_shutdown():
            post_target()
            r.sleep()

    except rospy.ROSInterruptException as e:
        print(e)
