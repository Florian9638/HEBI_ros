# HEBI_ros
Familiarize with commanding the HEBI motos using ROS

Necessary python package:
pip install hebi-py

STEP 1: Publisher and Subscriber

Goal: create two ros nodes that allow the user to specify a desired joint angle and the real Hebi motor has to execute it.

Package: hebi_motor/scripts

hebi_sub2.py and hebi_pub2.py are subscriber and publisher to move the real motor. Open 3 terminals, remember to source the environment in each of them ($ source devel/setup.bash) and type the following commands:

$ roscore
$ rosrun hebi_motor hebi_sub2.py (this node is waiting for the value comming from the publisher)
$ rosrun hebi_motor hebi_pub2.py (in the console you will be asked to enter a desired angle in radiants)



STEP2: Moveit!

Goal: move the simulated Hebi motor (with a link attached) in Gazebo through Moveit using the given Hebi Controllers.

Remember to source the environment ($ source devel/setup.bash) and use this command to visualize the arm in Gazebo:

$ roslaunch hebi_moveit_config gazebo_moveit_integration.launch

Either use moveit through Rviz or use the following script:

$ rosrun hebi_motor single_joint_motion.py



STEP 3: Move the real Hebi motor with ROS

Goal: move both the real motor and the simulated arm (in Gazebo) using moveit_command.
