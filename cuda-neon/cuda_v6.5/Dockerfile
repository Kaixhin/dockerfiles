# Start with CUDA base image
FROM kaixhin/cuda:6.5
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Edits to keep within Docker Hub Automated Builds memory limit:
# - Redirecting stdout to /dev/null
# - No multithreading in make

# Install build-essential, git, python-dev, pip and other dependencies
RUN apt-get update > /dev/null && apt-get install -y \
  build-essential \
  git \
  pkg-config \
  python-dev \
  python-pip \
  python-virtualenv \
  libhdf5-dev \
  libopencv-dev \
  libyaml-dev \
  > /dev/null

# Upgrade six
RUN pip install --upgrade six > /dev/null

# Clone neon repo and move into it
RUN cd /root && git clone https://github.com/NervanaSystems/neon.git && cd neon && \
# Make
  make sysinstall > /dev/null
# Set ~/neon as working directory
WORKDIR /root/neon
