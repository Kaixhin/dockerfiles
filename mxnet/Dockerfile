# Start with Ubuntu base image
FROM ubuntu:14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install build-essential, git and other dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  libblas-dev \
  libopencv-dev \
  python-dev \
  python-numpy \
  python-setuptools \
  r-base \
  wget

# Clone MXNet repo and move into it
RUN cd /root && git clone --recursive https://github.com/dmlc/mxnet && cd mxnet && \
# Make 
  make -j"$(nproc)"

# Install Python package
RUN cd /root/mxnet/python && python setup.py install

# Install R dependencies
RUN cd /opt && \
  # Download Rcpp
  wget https://cran.r-project.org/src/contrib/Rcpp_0.12.1.tar.gz && \
  # Install Rcpp
  R CMD INSTALL Rcpp_0.12.1.tar.gz

# Install R package
RUN cd /root/mxnet && R CMD INSTALL R-package

# Set ~/mxnet as working directory
WORKDIR /root/mxnet
