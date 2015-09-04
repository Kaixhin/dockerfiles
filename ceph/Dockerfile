# Start with Ubuntu base image
FROM ubuntu:14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install ceph
RUN apt-get update && apt-get install -y ceph

# Copy scripts
COPY auth.sh /opt/auth.sh
COPY monmap.sh /opt/monmap.sh
COPY mon.sh /opt/mon.sh

# Add mounted volumes
#VOLUME /etc/ceph /var/lib/ceph
