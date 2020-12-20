#!/usr/bin/env python

import rospy
from hebi_motor.msg import custom_msg  # from <package_name> import <message_name>

def publisher():

    pub = rospy.Publisher('move_real_hebi', custom_msg, queue_size=10) # topic name and message type
    rospy.init_node('hebi_publisher', anonymous=True) # initialize node
    rate = rospy.Rate(5) # rate in [Hz] at which messages are published

    msg_to_publish = custom_msg() # The msg_to_publish will contain the desired joint angle in [rad]

    while not rospy.is_shutdown():
        # Desired joint angle
        theta = input('Enter desired joint value in radiants: ')

        msg_to_publish.num_float = theta # 'data' is the name of a desired float64 value

        pub.publish(msg_to_publish) # what this node is going to publish

        rospy.loginfo(theta) # to print the published message in the terminal

        rate.sleep()

# Call the publisher function:

if __name__ == '__main__':
    publisher()
