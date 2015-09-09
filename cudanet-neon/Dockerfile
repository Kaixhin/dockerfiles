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

# Change to the /tmp directory
RUN cd /tmp && \
# Download run file
  wget http://developer.download.nvidia.com/compute/cuda/7_0/Prod/local_installers/cuda_7.0.28_linux.run && \
# Make the run file executable and extract
  chmod +x cuda_*_linux.run && ./cuda_*_linux.run -extract=`pwd` && \
# Install CUDA samples (silent) for helper_cuda.h
  ./cuda-samples-linux-*.run -noprompt && \
# Clean up
  rm -rf *

# Clone neon repo and move into it
RUN cd /root && git clone https://github.com/NervanaSystems/neon.git && cd neon && \
# Enable cudanet
  sed -i 's/GPU = 0/GPU = cudanet/g' setup.cfg && \
# Make on single core (fails multithreaded)
  make install
# Add libraries to path
ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
# Set ~/neon as working directory
WORKDIR /root/neon
