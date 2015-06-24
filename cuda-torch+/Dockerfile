# Start with CUDA Torch base image
FROM kaixhin/cuda-torch
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Move cuDNN over and extract
ADD cudnn*.tgz root/
# Install cuDNN
RUN cd root/cudnn* && \
  cp *.h /usr/local/cuda/include/ && \
  cp *.so* /usr/local/cuda/lib64/

# Install Folly, fbthrift, thpp and fblualib
RUN curl -sk https://raw.githubusercontent.com/soumith/fblualib/master/install_all.sh | bash -e

# Clone nn repo and move into it
RUN cd root && git clone https://github.com/torch/nn && cd nn && \
# Checkout getParamsByDevice branch
  git checkout getParamsByDevice && \
# Make
  luarocks make rocks/nn-scm-1.rockspec

# Clone fbtorch repo and move into it
RUN cd root && git clone https://github.com/facebook/fbtorch.git && cd fbtorch && \
# Make
  luarocks make rocks/fbtorch-scm-1.rockspec

# Clone fbnn repo and move into it
RUN cd root && git clone https://github.com/facebook/fbnn.git && cd fbnn && \
# Make
  luarocks make rocks/fbnn-scm-1.rockspec

# Clone fbcunn repo and move into it
RUN cd root && git clone https://github.com/facebook/fbcunn.git && cd fbcunn && \
# Make
  luarocks make rocks/fbcunn-scm-1.rockspec
