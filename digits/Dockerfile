# Start with Ubuntu base image
FROM ubuntu:16.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install dependencies
RUN apt-get update && apt-get install -y \
  autoconf \
  automake \
  build-essential \
  cmake \
  curl \
  git \
  gfortran \
  libatlas-base-dev \
  libboost-filesystem-dev \
  libboost-python-dev \
  libboost-system-dev \
  libboost-thread-dev \
  libtool \
  libgflags-dev \
  libgoogle-glog-dev \
  libhdf5-serial-dev \
  libleveldb-dev \
  liblmdb-dev \
  libopencv-dev \
  libsnappy-dev \
  python-all-dev \
  python-dev \
  python-h5py \
  python-matplotlib \
  python-numpy \
  python-opencv \
  python-pil \
  python-pip \
  python-pydot \
  python-scipy \
  python-skimage \
  python-sklearn \
  python-setuptools \
  unzip

# Install Protobuf 3
ENV PROTOBUF_ROOT /root/protobuf
RUN git clone https://github.com/google/protobuf.git $PROTOBUF_ROOT -b '3.2.x' && cd $PROTOBUF_ROOT && \
  ./autogen.sh && \
  ./configure && \
  make "-j$(nproc)" && \
  make install && \
  ldconfig && \
  cd python && python setup.py install --cpp_implementation

# Install NVIDIA Caffe 0.15
ENV CAFFE_ROOT /root/caffe
RUN git clone https://github.com/NVIDIA/caffe.git $CAFFE_ROOT -b 'caffe-0.15' && cd $CAFFE_ROOT && \
  pip install -r python/requirements.txt && \
  mkdir build && cd build && \
  cmake .. && \
  make -j"$(nproc)" && \
  make install

# Install DIGITS
ENV DIGITS_ROOT /root/digits
RUN git clone https://github.com/NVIDIA/DIGITS.git $DIGITS_ROOT && cd $DIGITS_ROOT && \
  pip install -r requirements.txt && \
  pip install -e .

# Enable volumes for host persistence
VOLUME /data
VOLUME /jobs

ENV DIGITS_JOBS_DIR=/jobs
ENV DIGITS_LOGFILE_FILENAME=/jobs/digits.log

# Expose server port
EXPOSE 5000
# Set working directory
WORKDIR /root/digits
# Start server
CMD ["./digits-devserver"]
