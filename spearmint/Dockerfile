# Start with Ubuntu base image
FROM ubuntu:14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install git, MongoDB, pip and other dependencies
RUN apt-get update && apt-get install -y \
  git \
  mongodb \
  python-pip \
  python-numpy \
  python-scipy

# Install PyMongo
RUN pip install pymongo

# Clone Spearmint repo and move into it
RUN cd /root && git clone https://github.com/HIPS/Spearmint.git && cd Spearmint && \
# Install
  pip install -e /root/Spearmint
# Set ~/Spearmint/spearmint as working directory
WORKDIR /root/Spearmint/spearmint
