# Start with Theano base image
FROM kaixhin/theano
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install optional dependencies
RUN apt-get update && apt-get install -y \
  curl \
  cython \
  python-imaging \
  python-matplotlib \
  python-yaml

# Clone Pylearn2 repo and move into it
RUN cd /root && git clone https://github.com/lisa-lab/pylearn2.git && cd pylearn2 && \
  # Install
  python setup.py develop

# Make and set data directory
RUN mkdir /data
ENV PYLEARN2_DATA_PATH=/data
VOLUME /data

# Add scripts to PATH
ENV PATH=/root/pylearn2/pylearn2/scripts:$PATH

# Set ~/pylearn2 as working directory
WORKDIR /root/pylearn2
