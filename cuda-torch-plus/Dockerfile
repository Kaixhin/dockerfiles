# Start with CUDA Torch base image
FROM kaixhin/cuda-torch
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install latest versions of nn, cutorch and cunn
RUN luarocks install nn && \
  luarocks install cutorch && \
  luarocks install cunn

# Move cuDNN over and extract
ADD cudnn*.tgz /root/
# Install cuDNN
RUN cd /root/cuda && \
  cp include/*.h /usr/local/cuda/include/ && \
  cp --preserve=links lib64/*.so* /usr/local/cuda/lib64/ && \
  cp lib64/*.a /usr/local/cuda/lib64/ && \
  luarocks install cudnn

# Install NCCL for multi-GPU communication
RUN cd /root && git clone https://github.com/NVIDIA/nccl.git && cd nccl && \
  make CUDA_HOME=/usr/local/cuda -j"$(nproc)" && \
  make PREFIX=/root/nccl -j"$(nproc)" install
ENV LD_LIBRARY_PATH=/root/nccl/lib:$LD_LIBRARY_PATH
RUN luarocks install nccl

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

# Install loadcaffe dependencies
RUN apt-get install -y \
  libprotobuf-dev \
  protobuf-compiler
# Install loadcaffe
RUN luarocks install loadcaffe

# Install torchx
RUN luarocks install torchx

# Install dpnn
RUN luarocks install dpnn

# Install dp
RUN luarocks install dp

# Install rnn
RUN luarocks install rnn

# Install nninit
RUN luarocks install nninit

# Install inn
RUN luarocks install inn

# Install stn
RUN luarocks install https://raw.githubusercontent.com/qassemoquab/stnbhwd/master/stnbhwd-scm-1.rockspec

# Install cuDNN
#ENV ML_REPO_PKG=nvidia-machine-learning-repo_4.0-1_amd64.deb
#RUN wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1404/x86_64/$ML_REPO_PKG && \
#dpkg -i $ML_REPO_PKG && \
#apt-get update && apt-get install -y libcudnn4 && \
#luarocks install cudnn
