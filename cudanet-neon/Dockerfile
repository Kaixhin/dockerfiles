# Start with CUDA base image
FROM kaixhin/cuda
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install git, python-dev, pip and other dependencies
RUN apt-get update && apt-get install -y \
  cmake \
  git \
  libatlas-base-dev \
  libjpeg-dev \
  libopencv-dev \
  python-dev \
  python-magic \
  python-matplotlib \
  python-numpy \
  python-pip \
  python-scipy

# Clone cuda-convnet2 repo (Nervana fork) and move into it
RUN cd root && git clone https://github.com/NervanaSystems/cuda-convnet2.git && cd cuda-convnet2 && \
# Make build directory and move into it
  mkdir build && cd build && \
# Cmake
  cmake .. && \
# Make install
  make -j"$(nproc)" install

# Clone neon repo and move into it
RUN cd root && git clone https://github.com/NervanaSystems/neon.git && cd neon && \
# Enable nervanagpu
  sed -i 's/GPU = 0/GPU = cudanet/g' setup.cfg && \
# Make
  make -j"$(nproc)" install
# Set ~/neon as working directory
WORKDIR /root/neon
