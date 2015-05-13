# Start with VNC base image
FROM kaixhin/vnc
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install wget
RUN apt-get update && apt-get install -y wget
# Set up sources and keys
RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list && \
  apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116
# Install ROS desktop full with rosinstall
RUN apt-get update && apt-get install -y \
  ros-jade-desktop-full \
  python-rosinstall
# Initialise rosdep
RUN rosdep init && rosdep update
# Set up environment
RUN echo "source /opt/ros/jade/setup.bash" >> ~/.bashrc
