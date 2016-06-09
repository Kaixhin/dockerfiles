# Start with cuDNN base image
FROM nvidia/cuda:7.0-cudnn5-devel
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install git, bc, cmake and dependencies
RUN apt-get update && apt-get install -y \
  git \
  bc \
  cmake \
  libgflags-dev \
  libgoogle-glog-dev \
  libopencv-dev \
  libleveldb-dev \
  libsnappy-dev \
  liblmdb-dev \
  libhdf5-serial-dev \
  libprotobuf-dev \
  protobuf-compiler \
  libatlas-base-dev \
  python-dev \
  python-pip \
  python-numpy \
  gfortran
# Install boost
RUN apt-get install -y --no-install-recommends libboost-all-dev

# Clone NVIDIA Caffe repo and move into it
RUN cd /root && git clone --branch caffe-0.14 https://github.com/NVIDIA/caffe.git && cd caffe && \
# Install python dependencies
  cat python/requirements.txt | xargs -n1 pip install
