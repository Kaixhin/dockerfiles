# Start with Ubuntu base image
FROM ubuntu:14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install build-essential, git and other dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  cmake \
  cython \
  git \
  python-numpy

# Clone CGT repo and move into it
RUN cd /root && git clone https://github.com/joschu/cgt && cd cgt && \
# Make build dir and move into it
  mkdir build && cd build && \
# CMake
  cmake .. && \
# Make 
  make -j"$(nproc)"

# Add to Python path
ENV PYTHONPATH=/root/cgt:/root/cgt/build/lib:$PYTHONPATH

# Set ~/cgt as working directory
WORKDIR /root/cgt
