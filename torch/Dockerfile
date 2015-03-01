# Start with CUDA base image
FROM kaixhin/cuda
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install curl and IPython (for iTorch)
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  curl \
  ipython
# Run Torch7 installation scripts
RUN curl -sk https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash
RUN git clone https://github.com/torch/distro.git ~/torch --recursive
RUN cd ~/torch; ./install.sh
# Set ~/torch as working directory
WORKDIR /root/torch
