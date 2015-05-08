# Start with CUDA base image
FROM kaixhin/cuda
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install git, python-dev, pip and other dependencies
RUN apt-get update && apt-get install -y \
  git \
  libatlas3gf-base \
  libatlas-dev \
  python-dev \
  python-pip \
  python-nose \
  python-numpy \
  python-scipy

# Set CUDA_ROOT
ENV CUDA_ROOT /usr/local/cuda/bin
# Install Theano
RUN pip install Theano
# Set up .theanorc for CUDA
RUN echo "[global]\ndevice=gpu\nfloatX=float32" > /root/.theanorc
