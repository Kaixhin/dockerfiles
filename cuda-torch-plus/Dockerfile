# Start with CUDA Torch base image
FROM kaixhin/cuda-torch
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Move cuDNN over and extract
ADD cudnn*.tgz /root/
# Install cuDNN
RUN cd /root/cudnn* && \
  cp *.h /usr/local/cuda/include/ && \
  cp --preserve=links *.so* /usr/local/cuda/lib64/ && \
  cp *.a /usr/local/cuda/lib64/

# Install Folly dependencies
RUN apt-get update && apt-get install -y \
  g++ \
  automake \
  autoconf \
  autoconf-archive \
  libtool \
  libboost-all-dev \
  libevent-dev \
  libdouble-conversion-dev \
  libgoogle-glog-dev \
  libgflags-dev \
  liblz4-dev \
  liblzma-dev \
  libsnappy-dev \
  make \
  zlib1g-dev \
  binutils-dev \
  libjemalloc-dev \
  libssl-dev \
  libiberty-dev

# Clone Folly repo and move into it
RUN cd /root && git clone https://github.com/facebook/folly.git && cd folly/folly && \
# Check out v0.47.0 for FBThrift
  git fetch && git checkout v0.47.0 && \
# Set up build
  autoreconf --install && \
  ./configure && \
# Make
  make -j"$(nproc)" && \
# Make install
  make -j"$(nproc)" install

# Install FBThrift dependencies
RUN apt-get install -y \
  flex \
  bison \
  libkrb5-dev \
  libsasl2-dev \
  libnuma-dev \
  pkg-config \
  libssl-dev

# Clone FBThrift repo and move into it
RUN cd /root && git clone https://github.com/facebook/fbthrift.git && cd fbthrift/thrift && \
# Set up build
  autoreconf --install && \
  CPPFLAGS=" -I/root/folly/" LDFLAGS="-L/root/folly/folly/.libs/" ./configure && \
# Make
  make -j"$(nproc)" && \
# Make install
  make -j"$(nproc)" install

# Clone TH++ repo and move into it
RUN cd /root && git clone https://github.com/facebook/thpp.git && cd thpp/thpp && \
# Download and unzip gtest
  curl -JLO https://googletest.googlecode.com/files/gtest-1.7.0.zip && unzip gtest-1.7.0.zip && \
# Incorporate fix (temporary)
  sed -i 's/--no-as-needed")/--no-as-needed,-lboost_thread,-lboost_system")/g' CMakeLists.txt && \
# Make build directory and move into it
  mkdir build && cd build && \
# Add Torch to CMake path
  export CMAKE_PREFIX_PATH=/root/torch/install && \
# CMake
  cmake .. && \
# Make
  make -j"$(nproc)" && \
# Make install
  make -j"$(nproc)" install

# Install FBLuaLib dependencies
RUN apt-get install -y \
  libedit-dev \
  libmatio-dev \
  libpython-dev \
  python-numpy

# Clone FBLuaLib repo and move into it
RUN cd /root && git clone https://github.com/facebook/fblualib.git && cd fblualib/fblualib && \
# Add Torch to CMake path
  export CMAKE_PREFIX_PATH=/root/torch/install && \
# Build
  ./build.sh

# Clone nn repo and move into it
RUN cd /root && git clone https://github.com/torch/nn && cd nn && \
# Checkout getParamsByDevice branch
  git checkout getParamsByDevice && \
# Make
  luarocks make rocks/nn-scm-1.rockspec

# Clone fbtorch repo and move into it
RUN cd /root && git clone https://github.com/facebook/fbtorch.git && cd fbtorch && \
# Make
  luarocks make rocks/fbtorch-scm-1.rockspec

# Clone fbnn repo and move into it
RUN cd /root && git clone https://github.com/facebook/fbnn.git && cd fbnn && \
# Make
  luarocks make rocks/fbnn-scm-1.rockspec

# Clone fbcunn repo and move into it
RUN cd /root && git clone https://github.com/facebook/fbcunn.git && cd fbcunn && \
# Make
  luarocks make rocks/fbcunn-scm-1.rockspec

# Install LuaSocket
RUN luarocks install luasocket

# Install json
RUN luarocks install json

# Install parallel
RUN luarocks install parallel

# Install torchx
RUN luarocks install torchx

# Install dpnn
RUN luarocks install dpnn

# Install dp
RUN luarocks install dp

# Install rnn
RUN luarocks install rnn

# Install oxnn
RUN luarocks install https://raw.githubusercontent.com/tkocisky/oxnn/master/oxnn-scm-1.rockspec

# Install stn
RUN luarocks install https://raw.githubusercontent.com/qassemoquab/stnbhwd/master/stnbhwd-scm-1.rockspec
