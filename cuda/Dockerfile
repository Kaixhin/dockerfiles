# Start with Ubuntu base image
FROM ubuntu:14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install wget and build-essential
RUN apt-get update && apt-get install -y \
  build-essential \
  wget
# CUDA version - as the kernel is shared the host and container must correspond
ENV CUDA_MAJOR=7.0 \
  CUDA_VERSION=7.0.28 \
  CUDA_MAJOR_U=7_0

# Change to the /tmp directory
RUN cd /tmp && \
# Download run file
  wget http://developer.download.nvidia.com/compute/cuda/${CUDA_MAJOR_U}/Prod/local_installers/cuda_${CUDA_VERSION}_linux.run && \
# Make the run file executable and extract
  chmod +x cuda_*_linux.run && ./cuda_*_linux.run -extract=`pwd` && \
# Install CUDA drivers (silent, no kernel)
  ./NVIDIA-Linux-x86_64-*.run -s --no-kernel-module && \
# Install toolkit (silent)  
  ./cuda-linux64-rel-*.run -noprompt && \
# Clean up
  rm -rf *

# Add to path
ENV PATH /usr/local/cuda/bin:${PATH}
# Configure dynamic link
RUN echo "/usr/local/cuda/lib64\n/usr/local/cuda/lib" >> /etc/ld.so.conf && ldconfig
