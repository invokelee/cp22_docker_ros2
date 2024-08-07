FROM osrf/ros:galactic-desktop

# Minimal setup
RUN apt update \
 && apt install -y locales lsb-release
ARG DEBIAN_FRONTEND=noninteractive
RUN locale-gen en_US en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

# Install ROS2 Humble
RUN apt update \
 && apt install -y --no-install-recommends curl \
 && apt install -y --no-install-recommends gnupg2
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Install packages.
RUN apt-get update && apt-get install -y \
    python-is-python3 \
    vim \
    less \
    xterm \
    && rm -rf /var/lib/apt/lists/*

RUN apt update \
# && apt upgrade \
 && apt install -y ros-galactic-desktop \
 && apt install -y ros-galactic-rviz2 \
 && apt install -y ros-galactic-robot-state-publisher \
 && apt install -y ros-galactic-joint-* \
 && apt install -y ros-galactic-gazebo-* 

 RUN echo "source /opt/ros/galactic/setup.bash" >> ~/.bashrc