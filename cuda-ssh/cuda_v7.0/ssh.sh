#!/bin/bash

# Set up LD_LIBRARY_PATH
ldconfig
# Run SSH daemon in foreground
/usr/sbin/sshd -D
