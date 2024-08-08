#! /bin/bash
echo "[$(date +'%F %T')] Starting ROS2 Simulation of TortoiseBot..."
source /tortoise_ws/install/setup.bash && ros2 launch tortoisebot_bringup bringup.launch.py use_sim_time:=True
# update test