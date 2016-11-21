# Start with cuDNN base image
FROM nvidia/cuda:7.5-cudnn5-devel
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install git, wget, bc, cmake and dependencies
RUN apt-get update && apt-get install -y \
  git \
  wget \
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

# Install NCCL for multi-GPU communication
RUN cd /root && git clone https://github.com/NVIDIA/nccl.git && cd nccl && \
  make CUDA_HOME=/usr/local/cuda -j"$(nproc)" && \
  make PREFIX=/root/nccl install
ENV LD_LIBRARY_PATH=/root/nccl/lib:$LD_LIBRARY_PATH
ENV NCCL_INCLUDE_DIR=/root/nccl/include
ENV NCCL_LIBRARY=/root/nccl/lib

# Clone NVIDIA Caffe repo and move into it
RUN cd /root && git clone https://github.com/NVIDIA/caffe.git && cd caffe && \
# Install python dependencies
  cat python/requirements.txt | xargs -n1 pip install
