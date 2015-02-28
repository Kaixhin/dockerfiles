# Start with Ubuntu base image
FROM ubuntu:14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Set /tmp as working directory
WORKDIR /tmp
# Install wget and build-essential
RUN apt-get update && apt-get install -y \
  build-essential \
  wget
# CUDA version and location of run file
ENV CUDA_MAJOR=6.5 \
  CUDA_VERSION=6.5.14 \
  CUDA_MAJOR_U=6_5 \
  CUDA_RUN=http://developer.download.nvidia.com/compute/cuda/${CUDA_MAJOR_U}/rel/installers/cuda_${CUDA_VERSION}_linux_64.run
# Download run file, make executable and extract
RUN wget ${CUDA_RUN} && chmod +x cuda_*_linux_64.run && ./cuda_*_linux_64.run -extract=`pwd`
# Install CUDA drivers (silent, no kernel) - as the kernel is shared the host and container must correspond
RUN ./NVIDIA-Linux-x86_64-*.run -s --no-kernel-module
# INSTALL CUDA toolkit (silent)
RUN ./cuda-linux64-rel-*.run -noprompt
# Add to path
ENV PATH /usr/local/cuda/bin:${PATH}
# Configure dynamic link
RUN echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf && ldconfig
# Cleanup
RUN rm -rf *
# Reset working directory
WORKDIR /
