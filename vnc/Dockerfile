# Start with Ubuntu base image
FROM ubuntu:16.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install LXDE, VNC server and Firefox
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  firefox \
  lxde-core \
  lxterminal \
  tightvncserver
# Set user for VNC server (USER is only for build)
ENV USER root
# Set default password
COPY password.txt .
RUN cat password.txt password.txt | vncpasswd && \
  rm password.txt
# Expose VNC port
EXPOSE 5901

# Copy VNC script that handles restarts
COPY vnc.sh /opt/
CMD ["/opt/vnc.sh"]
