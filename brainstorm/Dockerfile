# Start with Ubuntu base image
FROM ubuntu:14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install dependencies
RUN apt-get update && apt-get install -y \
  git \
  libhdf5-dev \
  python-dev \
  python-numpy \
  python-pip

# Remove OS-installed six
RUN rm /usr/lib/python2.7/dist-packages/six*

# Clone Brainstorm repo and move into it
RUN cd /root && git clone https://github.com/IDSIA/brainstorm.git && cd brainstorm && \
# Install requirements
  pip install -r requirements.txt && \
# Install
  python setup.py install

# Make and set data directory
RUN mkdir /data
ENV BRAINSTORM_DATA_DIR=/data
VOLUME /data

# Set ~/brainstorm as working directory
WORKDIR /root/brainstorm
