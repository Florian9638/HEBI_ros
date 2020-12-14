#!/usr/bin/env python3

import rospy
import hebi
import numpy as np
from math import pi
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

num_joints = group.size
group_feedback = hebi.GroupFeedback(num_joints)

if group.get_next_feedback(reuse_fbk=group_feedback) is None:
    print('Error getting feedback.')
    exit(1)

positions = np.zeros((num_joints, 3), dtype=np.float64)
offset = [pi] * num_joints
current_pos = group_feedback.position


def subscriber():

    sub = rospy.Subscriber('move_real_hebi', custom_msg, callback_function) # initialize the subscriber object
    rospy.init_node('hebi_subscriber', anonymous=True)
    rospy.spin()

# callback_function: is a function that is called every time a message is published to the topic
def callback_function(message):

    positions[:, 0] = current_pos
    positions[:, 1] = current_pos + message.data
    positions[:, 2] = current_pos

    time_vector = [0, 3, 6]

    trajectory = hebi.trajectory.create_trajectory(time_vector, positions)

    # Start logging in the background
    group.start_log('logs', mkdirs=True)

    group_command = hebi.GroupCommand(num_joints)
    duration = trajectory.duration

    start = time()
    t = time() - start

    while t < duration:
        # Serves to rate limit the loop without calling sleep
        group.get_next_feedback(reuse_fbk=group_feedback)
        t = time() - start

        pos, vel, acc = trajectory.get_state(t)
        group_command.position = pos
        group_command.velocity = vel
        group.send_command(group_command)

    group.stop_log()


if __name__ == "__main__":
    subscriber()
