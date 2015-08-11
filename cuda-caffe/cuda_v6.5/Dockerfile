# Start with CUDA base image
FROM kaixhin/cuda:6.5
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
RUN cd /root && git clone https://github.com/BVLC/caffe.git && cd caffe && \
# Copy Makefile
  cp Makefile.config.example Makefile.config && \
# Make
  make -j"$(nproc)" all
# Set ~/caffe as working directory
WORKDIR /root/caffe
