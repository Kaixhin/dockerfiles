# Start with Ubuntu base image
FROM ubuntu:14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install git, bc and dependencies
RUN apt-get update && apt-get install -y \
  git \
  bc \
  libatlas-base-dev \
  libatlas-dev \
  libboost-all-dev \
  libopencv-dev \
  libprotobuf-dev \
  libgoogle-glog-dev \
  libgflags-dev \
  protobuf-compiler \
  libhdf5-dev \
  libleveldb-dev \
  liblmdb-dev \
  libsnappy-dev

# Clone Caffe repo and move into it
RUN cd root && git clone https://github.com/BVLC/caffe && cd caffe && \
# Copy Makefile
  cp Makefile.config.example Makefile.config && \
# Enable CPU-only
  sed -i 's/# CPU_ONLY/CPU_ONLY/g' Makefile.config && \
# Make
  make all
# Set ~/caffe as working directory
WORKDIR /root/caffe
