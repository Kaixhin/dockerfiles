# Start with Ubuntu base image
FROM ubuntu:14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install build-essential, git and other dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  libblas-dev \
  libopencv-dev

# Clone MXNet repo and move into it
RUN cd /root && git clone --recursive https://github.com/dmlc/mxnet && cd mxnet && \
# Make 
  make -j"$(nproc)"

# Install Python package
RUN cd /root/mxnet/python && python setup.py install

# Install R package
RUN cd /root/mxnet && R CMD INSTALL R-package

# Set ~/mxnet as working directory
WORKDIR /root/mxnet
