# Start with Ubuntu base image
FROM ubuntu:14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Set /tmp as working directory
WORKDIR /tmp
# Install wget and build-essential
RUN apt-get update && apt-get install -y \
  build-essential \
  wget
# CUDA version
# TODO Extract from nvcc --version on host
COPY cuda_version.sh ./
# Use bash as Docker uses sh
RUN source ./cuda_version.sh
# ?????????????????????
# Location of CUDA run file
ENV CUDA_RUN http://developer.download.nvidia.com/compute/cuda/${CUDA_MAJOR_U}/rel/installers/cuda_${CUDA_VERSION}_linux_64.run
# Download run file into /opt and make executable
RUN wget ${CUDA_RUN} && chmod +x cuda_*_linux_64.run
# Extract separate installers
# TODO Find out why WORKDIR can't be used
RUN ./cuda_*_linux_64.run -extract=${WORKDIR}
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
# Default command
CMD ["/bin/bash"]
