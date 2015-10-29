# Start with CUDA base image
FROM kaixhin/cuda:7.0
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install git and other dependencies
RUN apt-get update && apt-get install -y \
  git \
  libopenblas-dev \
  libopencv-dev \
  python-dev \
  python-numpy \
  python-setuptools \
  r-base

# Clone MXNet repo and move into it
RUN cd /root && git clone --recursive https://github.com/dmlc/mxnet && cd mxnet && \
# Copy config.mk
  cp make/config.mk config.mk && \
# Set OpenBLAS
  sed -i 's/USE_BLAS = blas/USE_BLAS = openblas/g' config.mk && \
# Set CUDA flag
  sed -i 's/USE_CUDA = 0/USE_CUDA = 1/g' config.mk && \
  sed -i 's/USE_CUDA_PATH = NONE/USE_CUDA_PATH = \/usr\/local\/cuda/g' config.mk && \
# Make 
  make -j"$(nproc)"

# Install Python package
RUN cd /root/mxnet/python && python setup.py install

# Install R dependencies
RUN cd /opt && \
  # Download Rcpp
  wget https://cran.r-project.org/src/contrib/Rcpp_0.12.1.tar.gz && \
  # Install Rcpp
  R CMD INSTALL Rcpp_0.12.1.tar.gz

# Install R package
RUN cd /root/mxnet && R CMD INSTALL R-package

# Set ~/mxnet as working directory
WORKDIR /root/mxnet
