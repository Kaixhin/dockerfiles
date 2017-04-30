# Start with cuDNN base image
FROM nvidia/cuda:7.5-cudnn5-devel-ubuntu14.04
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
RUN apt-get install -y cuda-ld-conf-7-5 && \
  wget https://github.com/NVIDIA/nccl/releases/download/v1.2.3-1%2Bcuda7.5/libnccl1_1.2.3-1.cuda7.5_amd64.deb && \
  dpkg -i libnccl1_1.2.3-1.cuda7.5_amd64.deb && \
  rm libnccl1_1.2.3-1.cuda7.5_amd64.deb && \
  wget https://github.com/NVIDIA/nccl/releases/download/v1.2.3-1%2Bcuda7.5/libnccl-dev_1.2.3-1.cuda7.5_amd64.deb && \
  dpkg -i libnccl-dev_1.2.3-1.cuda7.5_amd64.deb && \
  rm libnccl-dev_1.2.3-1.cuda7.5_amd64.deb

# Clone NVIDIA Caffe repo and move into it
RUN cd /root && git clone https://github.com/NVIDIA/caffe.git && cd caffe && \
# Install python dependencies
  cat python/requirements.txt | xargs -n1 pip install
