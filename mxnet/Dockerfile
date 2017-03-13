# Start with Ubuntu base image
FROM ubuntu:14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install build-essential, git, wget and other dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  libopenblas-dev \
  libopencv-dev \
  python-dev \
  python-numpy \
  python-pip \
  python-setuptools \
  wget

# Clone MXNet repo and move into it
RUN cd /root && git clone --recursive https://github.com/dmlc/mxnet && cd mxnet && \
# Copy config.mk
  cp make/config.mk config.mk && \
# Set OpenBLAS
  sed -i 's/USE_BLAS = atlas/USE_BLAS = openblas/g' config.mk && \
# Make 
  make -j"$(nproc)"

# Install Python package
RUN cd /root/mxnet/python && python setup.py install

# Add to Python path
RUN echo "export PYTHONPATH=$MXNET_HOME/python:$PYTHONPATH" >> /root/.bashrc

# Install graphviz and jupyter
RUN pip install graphviz jupyter

# Set ~/mxnet as working directory
WORKDIR /root/mxnet
