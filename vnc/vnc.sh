#!/bin/bash

# Exit VNC server gracefully
trap "vncserver -kill :1; exit 0" SIGTERM
# Run VNC server with tail in the foreground
vncserver :1 -geometry 1280x800 -depth 24 && tail -F /root/.vnc/*.log
