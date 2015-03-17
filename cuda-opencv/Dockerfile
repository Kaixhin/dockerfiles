# Start with CUDA base image
FROM kaixhin/cuda
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install dependencies
RUN apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev && \
# Install optional dependencies
  apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

# Clone OpenCV repo and move into it
RUN git clone https://github.com/Itseez/opencv.git && cd opencv && \
# Make build directory and move into it
  mkdir release && cd release && \
# Cmake
  cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local .. && \
# Make and install
  make && make install && \
# Clean up
  cd .. && rm -rf opencv
