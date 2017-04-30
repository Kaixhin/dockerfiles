# Start with cuDNN base image
FROM nvidia/cuda:6.5-devel-ubuntu14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install git, apt-add-repository and dependencies for iTorch
RUN apt-get update && apt-get install -y \
  git \
  software-properties-common \
  ipython3 \
  libssl-dev \
  libzmq3-dev \
  python-dev \
  python-pip \
  python-zmq \
  sudo

# Install Jupyter Notebook for iTorch
RUN pip install --upgrade pip
RUN pip install jupyter

# Run Torch7 installation scripts (dependencies only)
RUN git clone https://github.com/torch/distro.git /root/torch --recursive && cd /root/torch && \
  bash install-deps
