# Start with CUDA base image
FROM kaixhin/cuda:6.5
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install curl and dependencies for iTorch
RUN apt-get update && apt-get install -y \
  curl \
  ipython3 \
  python-zmq
# Run Torch7 installation scripts
RUN curl -sk https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash
RUN git clone https://github.com/torch/distro.git ~/torch --recursive
RUN cd ~/torch; ./install.sh
# Export paths
RUN . /root/torch/install/bin/torch-activate
# Set ~/torch as working directory
WORKDIR /root/torch

# Run Torch7 interactively
CMD ["/root/torch/install/bin/th"]
