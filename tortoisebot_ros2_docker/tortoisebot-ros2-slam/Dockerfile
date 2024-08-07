FROM invokelee/ros2_galactic:1.0

# Change the default shell to Bash
SHELL [ "/bin/bash" , "-c" ]

# Install Git
RUN apt update && apt install -y git python3-colcon-common-extensions
RUN apt install -y ros-galactic-rviz2 \
#  && apt install -y ros-galactic-robot-state-publisher \
#  && apt install -y ros-galactic-joint-* \
&& sudo apt install -y ros-galactic-navigation2 ros-galactic-nav2-bringup \
&& sudo apt install -y ros-galactic-cartographer \ 
&& sudo apt install -y ros-galactic-cartographer-ros \ 
&& sudo apt install -y ros-galactic-turtlebot3-gazebo 

# Create a Catkin workspace and clone TurtleBot3 repos
RUN source /opt/ros/galactic/setup.bash \
 && mkdir -p /tortoise_ws/src \
 && cd /tortoise_ws/src

WORKDIR /tortoise_ws/src
COPY ./tortoisebot/tortoisebot_navigation ./tortoisebot_navigation
COPY ./tortoisebot/tortoisebot_slam ./tortoisebot_slam
COPY ./tortoisebot/ydlidar-ros2 ./ydlidar-ros2

# RUN echo "export GAZEBO_MODEL_PATH=/neobotix_ws/src/neobotix_ros2/neo_simulation2/models:/neobotix_ws/src:/neobotix_ws/src/neobotix_ros2" >> ~/.bashrc
# RUN echo "export GAZEBO_MODEL_PATH=/usr/share/gazebo-11/models:/usr/share/gazebo-11/models:/usr/share/gazebo-9/models:/usr/share/gazebo/models_robox" >> ~/.bashrc


# Build the Colcon workspace and ensure it's sourced
RUN source /opt/ros/galactic/setup.bash \
 && cd /tortoise_ws \
 && colcon build
RUN echo "source /tortoise_ws/install/setup.bash" >> ~/.bashrc

# Set the working folder at startup
WORKDIR /tortoise_ws
COPY ./tortoisebot_ros2_docker/tortoisebot-ros2-slam/entrypoint.sh ./
CMD ["bash"]
# CMD ["/tortoise_ws/entrypoint.sh"]