# Start with cuDNN base image
FROM nvidia/cuda:8.0-cudnn5-devel
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install git, wget and other dependencies
RUN apt-get update && apt-get install -y \
  git \
  libopenblas-dev \
  libopencv-dev \
  python-dev \
  python-numpy \
  python-setuptools \
  wget

# Clone MXNet repo and move into it
RUN cd /root && git clone --recursive https://github.com/dmlc/mxnet && cd mxnet && \
# Copy config.mk
  cp make/config.mk config.mk && \
# Set OpenBLAS
  sed -i 's/USE_BLAS = atlas/USE_BLAS = openblas/g' config.mk && \
# Set CUDA flag
  sed -i 's/USE_CUDA = 0/USE_CUDA = 1/g' config.mk && \
  sed -i 's/USE_CUDA_PATH = NONE/USE_CUDA_PATH = \/usr\/local\/cuda/g' config.mk && \
# Set cuDNN flag
  sed -i 's/USE_CUDNN = 0/USE_CUDNN = 1/g' config.mk && \
# Make 
  make -j"$(nproc)"

# Install Python package
RUN cd /root/mxnet/python && python setup.py install

# Add to Python path
RUN echo "export PYTHONPATH=$MXNET_HOME/python:$PYTHONPATH" >> /root/.bashrc

# Install pip
RUN easy_install -U pip
# Install graphviz and jupyter
RUN pip install graphviz jupyter

# Set ~/mxnet as working directory
WORKDIR /root/mxnet
