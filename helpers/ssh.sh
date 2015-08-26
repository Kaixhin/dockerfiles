#!/bin/bash

# Ask for password
echo "Please enter a password (and then press enter):"
read password
# Install OpenSSH
apt-get update && apt-get install -y openssh-server
# Set password
mkdir /var/run/sshd && echo "root:$password" | chpasswd
# Allow root login with password
sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# Prevent user being kicked off after login
sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd
# Restart SSH daemon
service ssh restart
