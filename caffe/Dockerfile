# Start with CUDA base image
FROM kaixhin/cuda
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install dependencies
RUN apt-get update && apt-get install -y \
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
  libsnappy-dev \
  python-pip \
  gfortran

# Clone Caffe repo and move into it
RUN cd root && git clone https://github.com/BVLC/caffe && cd caffe && \
# Make and test
  cp Makefile.config.example Makefile.config && \
  make all && \
  make test && \
  make runtest
# Set ~/caffe as working directory
WORKDIR /root/caffe
