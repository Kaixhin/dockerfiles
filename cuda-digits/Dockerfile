# Start with CUDA base image
FROM kaixhin/cuda
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install git, bc and dependencies
RUN apt-get update && apt-get install -y \
  git \
  bc \
  libatlas-base-dev \
  libatlas-dev \
  libboost-all-dev \
  libopencv-dev \
  libprotobuf-dev \
  libgoogle-glog-dev \
  libgflags-dev \
  protobuf-compiler \
  libhdf5-dev \
  libleveldb-dev \
  liblmdb-dev \
  libsnappy-dev \
  python-pip \
  gfortran

# Clone NVIDIA Caffe repo and move into it
RUN cd root && git clone --branch v0.11.0 https://github.com/NVIDIA/caffe.git && cd caffe && \
# Install python dependencies
  cd python && \
  for req in $(cat requirements.txt); do pip install $req; done && \
  cd .. && \
# Copy Makefile
  cp Makefile.config.example Makefile.config && \
# Disable cuDNN
  sed -i 's/USE_CUDNN/# USE_CUDNN/g' Makefile.config && \
# Make
  make -j"$(nproc)" all && \
  make -j"$(nproc)" py
# Set environment variable
ENV CAFFE_HOME /root/caffe

# Clone DIGITS and move into it
RUN cd root && git clone https://github.com/NVIDIA/DIGITS.git digits && cd digits && \
# Install dependencies
  apt-get install -y graphviz gunicorn && \
# Install python dependencies
  for req in $(cat requirements.txt); do pip install $req; done

# Expose server port
EXPOSE 8080
# Set ~/digits as working directory
WORKDIR /root/digits
# Start server
CMD ["/root/digits/digits-server"]
