# Start with CUDA Caffe dependencies
FROM kaixhin/cuda-caffe-deps:latest
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Move into Caffe repo
RUN cd /root/caffe && \
# Make and move into build directory
  mkdir build && cd build && \
# CMake
  cmake .. && \
# Make
  make -j"$(nproc)" all && \
  make install

# Add to Python path
ENV PYTHONPATH=/root/caffe/python:$PYTHONPATH

# Set ~/caffe as working directory
WORKDIR /root/caffe
