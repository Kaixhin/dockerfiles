# Start with CUDA Torch base image
FROM kaixhin/cuda-torch
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Move cuDNN over and extract
ADD cudnn*.tgz /root/
# Install cuDNN
RUN cd /root/cudnn* && \
  cp *.h /usr/local/cuda/include/ && \
  cp *.so* /usr/local/cuda/lib64/ && \
  cp *.a /usr/local/cuda/lib64/

# Run apt-get update (before running deps.sh)
RUN apt-get update

# Clone FBThrift repo and move into it
RUN cd /root && git clone https://github.com/facebook/fbthrift.git && cd fbthrift/thrift && \
# Install dependencies (including Folly) and build
  ./deps.sh

# Clone TH++ repo and move into it
RUN cd /root && git clone https://github.com/facebook/thpp.git && cd thpp/thpp && \
# Add Torch to CMake path
 # export CMAKE_PREFIX_PATH=/root/torch/install && \
 ls /root/fbthrift && ls /root/fbthrift/folly && \
 export LD_LIBRARY_PATH=/root/fbthrift/folly/folly/.libs/:$LD_LIBRARY_PATH && \
# aIncorporate fix (temporary)
 # sed -i 's/--no-as-needed")/--no-as-needed,-lboost_thread,-lboost_system")/g' CMakeLists.txt && \
# Build
  ./build.sh

# Install fblualib dependencies
RUN apt-get install -y \
  libedit-dev \
  libmatio-dev \
  libpython-dev \
  python-numpy

# Clone fblualib repo and move into it
RUN cd /root && git clone https://github.com/facebook/fblualib.git && cd fblualib/fblualib && \
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

# Install autobw
luarocks install https://raw.githubusercontent.com/bshillingford/autobw.torch/master/autobw-scm-1.rockspec
