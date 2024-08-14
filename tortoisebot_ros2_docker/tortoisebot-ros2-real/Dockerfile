# Base image
FROM invokelee/galactic-base:1.0

SHELL ["/bin/bash", "-c"]

# Install some updates and utils
# RUN apt-get update
# RUN apt-get install -y python3-rpi.gpio iputils-ping vim

# Create workspace
RUN source /opt/ros/galactic/setup.bash \
 && mkdir -p /tortoise_ws/src \
 && cd /tortoise_ws/src

# Copy the files in the current directory into the container
WORKDIR /tortoise_ws/src
COPY ./tortoisebot ./

# Build the Colcon workspace and ensure it's sourced
RUN source /opt/ros/galactic/setup.bash \
 && cd /tortoise_ws \
 && colcon build \
 && source install/setup.bash

 # Source the setup.bash file before executing further commands
RUN echo "source /tortoise_ws/install/setup.bash" >> ~/.bashrc

# Set the working folder at startup
WORKDIR /tortoise_ws
# Start a bash shell when the container starts
CMD ["bash"]
