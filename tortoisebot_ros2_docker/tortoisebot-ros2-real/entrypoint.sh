#! /bin/bash
echo "[$(date +'%F %T')] Starting ROS2 Real Tortoisebot firmware bringup..."
ros2 daemon stop
ros2 topic list
source /tortoise_ws/install/setup.bash \
&& ros2 launch tortoisebot_bringup bringup.launch.py use_sim_time:=False
