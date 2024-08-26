#! /bin/bash
echo "[$(date +'%F %T')] Starting the ROS2 Mapping for Real tortoisebot..."
hostname
cat /etc/hosts
source /tortoise_ws/install/setup.bash \
&& ros2 launch tortoisebot_slam cartographer.launch.py use_sim_time:=False
