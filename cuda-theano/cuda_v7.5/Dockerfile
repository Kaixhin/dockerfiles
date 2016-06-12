# Start with cuDNN base image
FROM nvidia/cuda:7.5-cudnn5-devel
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install git, wget, python-dev, pip and other dependencies
RUN apt-get update && apt-get install -y \
  git \
  wget \
  libopenblas-dev \
  python-dev \
  python-pip \
  python-nose \
  python-numpy \
  python-scipy

# Set CUDA_ROOT
ENV CUDA_ROOT /usr/local/cuda/bin
# Install bleeding-edge Theano
RUN pip install --upgrade --no-deps git+git://github.com/Theano/Theano.git
# Set up .theanorc for CUDA
RUN echo "[global]\ndevice=gpu\nfloatX=float32\noptimizer_including=cudnn\n[lib]\ncnmem=1\n[nvcc]\nfastmath=True" > /root/.theanorc
