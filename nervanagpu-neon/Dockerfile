# Start with CUDA base image
FROM kaixhin/cuda:7.5
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install git, python-dev, pip and other dependencies
RUN apt-get update && apt-get install -y \
  git \
  libboost-all-dev \
  python-dev \
  python-numpy \
  python-pip

# Install PyCUDA and (upgrade) six
RUN pip install --upgrade pycuda six

# Clone MaxAs repo and move into it
RUN cd /root && git clone https://github.com/NervanaSystems/maxas.git && cd maxas && \
# Create makefile
  perl Makefile.PL && \
# Make
  make -j"$(nproc)" && \
  make -j"$(nproc)" install

# Clone NervanaGPU repo and move into it
RUN cd /root && git clone https://github.com/NervanaSystems/nervanagpu.git && cd nervanagpu && \
# Make
  make -j"$(nproc)"

# Clone neon repo and move into it
RUN cd /root && git clone https://github.com/NervanaSystems/neon.git && cd neon && \
# Enable nervanagpu
  sed -i 's/GPU = 0/GPU = nervanagpu/g' setup.cfg && \
# Make
  make -j"$(nproc)" install
# Set ~/neon as working directory
WORKDIR /root/neon
