# Start with CUDA base image
FROM kaixhin/cuda:latest
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install curl and dependencies for iTorch
RUN apt-get update && apt-get install -y \
  curl \
  ipython3 \
  python-zmq

# Install cuDNN
RUN CUDA_REPO_PKG=cuda-repo-ubuntu1404_7.5-18_amd64.deb && \
  wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/$CUDA_REPO_PKG && \
  dpkg -i $CUDA_REPO_PKG && \
  ML_REPO_PKG=nvidia-machine-learning-repo_4.0-2_amd64.deb && \
  wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1404/x86_64/$ML_REPO_PKG && \
  dpkg -i $ML_REPO_PKG && \
  apt-get update && apt-get install -yqq libcudnn4

# Run Torch7 installation scripts
RUN curl -sk https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash
RUN git clone https://github.com/torch/distro.git ~/torch --recursive
RUN cd ~/torch; ./install.sh

# Set ~/torch as working directory
WORKDIR /root/torch

# Export environment variables manually
ENV LUA_PATH='/root/.luarocks/share/lua/5.1/?.lua;/root/.luarocks/share/lua/5.1/?/init.lua;/root/torch/install/share/lua/5.1/?.lua;/root/torch/install/share/lua/5.1/?/init.lua;./?.lua;/root/torch/install/share/luajit-2.1.0-alpha/?.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua' \
  LUA_CPATH='/root/.luarocks/lib/lua/5.1/?.so;/root/torch/install/lib/lua/5.1/?.so;./?.so;/usr/local/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/loadall.so' \
  PATH=/root/torch/install/bin:$PATH \
  LD_LIBRARY_PATH=/root/torch/install/lib:$LD_LIBRARY_PATH \
  DYLD_LIBRARY_PATH=/root/torch/install/lib:$DYLD_LIBRARY_PATH
