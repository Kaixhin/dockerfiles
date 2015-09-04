# Start with Ubuntu base image
FROM ubuntu:14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install wget
RUN apt-get update && apt-get install -y wget

# Get Ceph release repository keys
RUN wget -q -O- 'https://ceph.com/git/?p=ceph.git;a=blob_plain;f=keys/release.asc' | sudo apt-key add -
# Add Ceph extras repository
RUN echo deb http://ceph.com/packages/ceph-extras/debian $(lsb_release -sc) main | tee /etc/apt/sources.list.d/ceph-extras.list
# Add Ceph Hammer release repository
RUN echo deb http://ceph.com/debian-hammer/ $(lsb_release -sc) main | tee /etc/apt/sources.list.d/ceph.list
# Install ceph
RUN apt-get install -y ceph

# Set /opt as working directory
WORKDIR /opt
# Copy scripts
COPY auth.sh /opt/auth.sh
COPY monmap.sh /opt/monmap.sh
COPY mon.sh /opt/mon.sh
