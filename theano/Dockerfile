# Start with Ubuntu base image
FROM ubuntu:14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install build-essential, git, python-dev, pip and other dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  libatlas3gf-base \
  libatlas-dev \
  python-dev \
  python-pip \
  python-nose \
  python-numpy \
  python-scipy

# Install Theano
RUN pip install Theano
