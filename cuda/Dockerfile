# Start with Ubuntu base image
# As the kernel is shared the host and container must correspond
FROM ubuntu:14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install wget and build-essential
RUN apt-get update && apt-get install -y \
  build-essential \
  wget
# CUDA version
ENV CUDA_MAJOR=6.5 \
  CUDA_VERSION=6.5.19 \
  CUDA_MAJOR_U=6_5

# The next few steps are combined to prevent storing the installers
# Change to the /tmp directory
RUN cd /tmp && \
# Download run file
  wget http://developer.download.nvidia.com/compute/cuda/${CUDA_MAJOR_U}/rel/installers/cuda_${CUDA_VERSION}_linux_64.run && \
# Make the run file executable and extract
  chmod +x cuda_*_linux_64.run && ./cuda_*_linux_64.run -extract=`pwd` && \
# Install CUDA drivers (silent, no kernel) and toolkit (silent)
  ./NVIDIA-Linux-x86_64-*.run -s --no-kernel-module && ./cuda-linux64-rel-*.run -noprompt && \
# Clean up
  rm -rf *

# Add to path
ENV PATH /usr/local/cuda/bin:${PATH}
# Configure dynamic link
RUN echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf && ldconfig
