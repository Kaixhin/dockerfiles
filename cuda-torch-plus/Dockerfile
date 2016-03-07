# Start with CUDA Torch base image
FROM kaixhin/cuda-torch
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install latest versions of nn, cutorch and cunn
RUN luarocks install nn && \
  luarocks install cutorch && \
  luarocks install cunn

# Install CUDA repo (needed for cuDNN)
ENV CUDA_REPO_PKG=cuda-repo-ubuntu1404_7.5-18_amd64.deb
RUN wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/$CUDA_REPO_PKG && \
  dpkg -i $CUDA_REPO_PKG

# Install cuDNN v4
ENV ML_REPO_PKG=nvidia-machine-learning-repo_4.0-2_amd64.deb
RUN wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1404/x86_64/$ML_REPO_PKG && \
  dpkg -i $ML_REPO_PKG && \
  apt-get update && apt-get install -y libcudnn4
# Install Torch cuDNN bindings
RUN cd /root && git clone https://github.com/soumith/cudnn.torch.git && cd cudnn.torch && \
  git checkout R4 && \
  luarocks make

# Install NCCL for multi-GPU communication
RUN cd /root && git clone https://github.com/NVIDIA/nccl.git && cd nccl && \
  make CUDA_HOME=/usr/local/cuda -j"$(nproc)" && \
  make PREFIX=/root/nccl install
ENV LD_LIBRARY_PATH=/root/nccl/lib:$LD_LIBRARY_PATH
RUN luarocks install nccl

# Install luaposix
RUN luarocks install luaposix

# Install Moses
RUN luarocks install moses

# Install cjson
RUN luarocks install lua-cjson

# Install LogRoll
RUN luarocks install logroll

# Install ffmpeg dependencies
RUN add-apt-repository ppa:mc3man/trusty-media && \
  apt-get update && apt-get install -y ffmpeg
# Install ffmpeg
RUN luarocks install ffmpeg

# Install LuaSocket
RUN luarocks install luasocket

# Install parallel
RUN luarocks install parallel

# Install IPC
RUN luarocks install ipc

# Install distlearn
RUN luarocks install distlearn

# Install classic
RUN luarocks install classic

# Install torchx
RUN luarocks install torchx

# Install autograd
RUN luarocks install autograd

# Install dataset
RUN luarocks install dataset

# Install dpnn
RUN luarocks install dpnn

# Install nninit
RUN luarocks install nninit

# Install nnquery
RUN luarocks install https://raw.githubusercontent.com/bshillingford/nnquery/master/rocks/nnquery-scm-1.rockspec

# Install rnn
RUN luarocks install rnn

# Install loadcaffe dependencies
RUN apt-get install -y \
  libprotobuf-dev \
  protobuf-compiler
# Install loadcaffe
RUN luarocks install loadcaffe

# Install inn
RUN luarocks install inn

# Install stn
RUN luarocks install https://raw.githubusercontent.com/qassemoquab/stnbhwd/master/stnbhwd-scm-1.rockspec

# Reinforcement learning

# Install xitari
RUN luarocks install https://raw.githubusercontent.com/Kaixhin/xitari/master/xitari-0-0.rockspec

# Install alewrap
RUN luarocks install https://raw.githubusercontent.com/Kaixhin/alewrap/master/alewrap-0-0.rockspec

# Install rlenvs
RUN luarocks install https://raw.githubusercontent.com/Kaixhin/rlenvs/master/rocks/rlenvs-scm-1.rockspec
