# Start with Theano base image
FROM kaixhin/theano
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Clone Keras repo and move into it
RUN cd /root && git clone https://github.com/fchollet/keras.git && cd keras && \
  # Install
  python setup.py install

# Set ~/keras as working directory
WORKDIR /root/keras
