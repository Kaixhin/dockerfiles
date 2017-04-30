# Start with cuDNN base image
FROM nvidia/cuda:7.5-cudnn5-devel-ubuntu14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install git, wget, bc and dependencies
RUN apt-get update && apt-get install -y \
  git \
  wget \
  bc \
  cmake \
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
  python-dev \
  python-pip \
  python-numpy \
  gfortran > /dev/null

# Install NCCL for multi-GPU communication
RUN apt-get install -y cuda-ld-conf-7-5 && \
  wget https://github.com/NVIDIA/nccl/releases/download/v1.2.3-1%2Bcuda7.5/libnccl1_1.2.3-1.cuda7.5_amd64.deb && \
  dpkg -i libnccl1_1.2.3-1.cuda7.5_amd64.deb && \
  rm libnccl1_1.2.3-1.cuda7.5_amd64.deb && \
  wget https://github.com/NVIDIA/nccl/releases/download/v1.2.3-1%2Bcuda7.5/libnccl-dev_1.2.3-1.cuda7.5_amd64.deb && \
  dpkg -i libnccl-dev_1.2.3-1.cuda7.5_amd64.deb && \
  rm libnccl-dev_1.2.3-1.cuda7.5_amd64.deb

# Clone Caffe repo and move into it
RUN cd /root && git clone https://github.com/BVLC/caffe.git && cd caffe && \
# Install python dependencies
  cat python/requirements.txt | xargs -n1 pip install
