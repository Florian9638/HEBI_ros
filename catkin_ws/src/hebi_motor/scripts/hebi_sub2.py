#!/usr/bin/env python

import rospy
import hebi
import numpy as np
from time import sleep, time
from hebi_motor.msg import custom_msg  # from <package_name> import <messagen_name>

lookup = hebi.Lookup()

# Wait 2 seconds for the module list to populate
sleep(2.0)

family_name = "X8-9"
module_name = "X-80931"

group = lookup.get_group_from_names([family_name], [module_name])

if group is None:
  print('Group not found: Did you forget to set the module family and name above?')
  exit(1)


def subscriber():

    sub = rospy.Subscriber('move_real_hebi', custom_msg, callback_function) # initialize the subscriber object
    rospy.init_node('hebi_subscriber', anonymous=True)
    rospy.spin()

# callback_function: is a function that is called every time a message is published to the topic
def callback_function(message):

    group_command  = hebi.GroupCommand(group.size)
    group_command.position = message.num_float
    group.send_command(group_command)
    rospy.loginfo(message.num_float) # to print the published message in the terminal

if __name__ == "__main__":
    subscriber()
