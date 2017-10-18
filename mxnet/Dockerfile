# Start with Ubuntu base image
FROM ubuntu:14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install build-essential, git, wget and other dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  graphviz \
  liblapack-dev \
  libopenblas-dev \
  libopencv-dev \
  python-dev \
  python-numpy \
  python-pip \
  python-setuptools \
  wget

# Clone MXNet repo and move into it
RUN cd /root && git clone --recursive https://github.com/apache/incubator-mxnet.git mxnet --branch 0.11.0 && cd mxnet && \
# Make 
  make -j $(nproc) USE_OPENCV=1 USE_BLAS=openblas

# Install Python package
RUN cd /root/mxnet/python && python setup.py install

# Set ~/mxnet as working directory
WORKDIR /root/mxnet
