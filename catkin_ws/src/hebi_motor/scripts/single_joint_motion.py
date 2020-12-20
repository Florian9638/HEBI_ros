#!/usr/bin/env python

import sys
import copy
import rospy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg
from math import pi

moveit_commander.roscpp_initialize(sys.argv) # to initialize the moveit_commander
rospy.init_node('hebi_move_joint', anonymous=True) # creation of the ros node

robot = moveit_commander.RobotCommander()
scene = moveit_commander.PlanningSceneInterface()
group = moveit_commander.MoveGroupCommander("hebi_arm") # I specify the group of my robot that I want to move (the group was specified in the Moveit Setup Assistant)
display_trajectory_publisher = rospy.Publisher('/move_group/display_planned_path', moveit_msgs.msg.DisplayTrajectory, queue_size=10)

# PLANNING A JOINT GOAL

# Prismatic joint
joint_goal = group.get_current_joint_values()
joint_goal[0] = 1.57 # [rad]
joint_goal[1] = 1.57 # [rad]
group.set_joint_value_target(joint_goal)

plan = group.plan() # plan the trajectory
group.go(wait=True) # execute the trajectory
rospy.sleep(1)

moveit_commander.roscpp_shutdown()
