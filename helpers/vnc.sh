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
# Start VNC server to create xstartup
vncserver :1
# Stop VNC server
vncserver -kill :1
# Add LXDE destkop to xstartup
echo "startlxde &" >> /root/.vnc/xstartup
# Start VNC server
vncserver :1 -geometry 1280x800 -depth 24 
