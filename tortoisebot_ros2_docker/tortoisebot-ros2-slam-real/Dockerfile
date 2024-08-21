# Base image
FROM invokelee/galactic-base:1.0

SHELL ["/bin/bash", "-c"]

# Create workspace
RUN source /opt/ros/galactic/setup.bash \
 && mkdir -p /tortoise_ws/src \
 && cd /tortoise_ws/src

WORKDIR /tortoise_ws/src
COPY ./tortoisebot/tortoisebot_navigation ./tortoisebot_navigation
COPY ./tortoisebot/tortoisebot_slam ./tortoisebot_slam

# Build the Colcon workspace and ensure it's sourced
RUN source /opt/ros/galactic/setup.bash \
 && cd /tortoise_ws \
 && colcon build \
 && source install/setup.bash

 # Source the setup.bash file before executing further commands
RUN echo "source /tortoise_ws/install/setup.bash" >> ~/.bashrc

# Set up the Network Configuration
# Example with the ROS_MASTER_URI value set as the one running on the Host System
# ENV ROS_MASTER_URI http://real1_bringup:11311

# Set the working folder at startup
WORKDIR /tortoise_ws
# Start a bash shell when the container starts
CMD ["bash"]
