# Start with VNC base image
FROM kaixhin/vnc
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install wget
RUN apt-get update && apt-get install -y wget

# Download NEURON (64-bit) package
RUN wget http://www.neuron.yale.edu/ftp/neuron/versions/v7.4/nrn-7.4.x86_64.deb && \
# Install
  dpkg -i nrn-7.4.x86_64.deb && \
# Clean up
  rm nrn-7.4.x86_64.deb
