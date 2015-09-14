# Start with CUDA base image
FROM kaixhin/cuda:6.5
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install build-essential, git, python-dev, pip and other dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  python-dev \
  python-pip \
  python-virtualenv \
  libhdf5-dev \
  libyaml-dev

# Upgrade six
RUN pip install --upgrade six

# Clone neon repo and move into it
RUN cd /root && git clone https://github.com/NervanaSystems/neon.git && cd neon && \
# Make
  make -j"$(nproc)" sysinstall
# Set ~/neon as working directory
WORKDIR /root/neon
