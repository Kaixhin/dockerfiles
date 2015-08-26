#!/bin/bash

# Install LXDE, VNC server and Firefox
apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  firefox \
  lxde-core \
  lxterminal \
  tightvncserver
# Set USER for VNC server
export USER=root
# Set password
vncpasswd
# Start VNC server
vncserver :1 -geometry 1280x800 -depth 24 
