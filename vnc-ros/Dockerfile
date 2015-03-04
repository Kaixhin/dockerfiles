# Start with VNC base image
FROM kaixhin/vnc
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install wget
RUN apt-get update && apt-get install -y wget
# Set up sources and keys
RUN echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list && \
  wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | apt-key add -
# Install ROS desktop full with rosinstall
RUN apt-get update && apt-get install -y \
  ros-indigo-desktop-full \
  python-rosinstall
# Initialise rosdep
RUN rosdep init && rosdep update
# Set up environment
RUN echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
