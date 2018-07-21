# Start with CUDA base image
FROM nvidia/cuda:9.2-devel-ubuntu16.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install OpenSSH, X server and libgtk (for NVIDIA Visual Profiler)
RUN apt-get update && apt-get install -y \
  openssh-server \
  xdm \
  libgtk2.0-0
# Set password
COPY password.txt .
RUN mkdir /var/run/sshd && \
  echo "root:`cat password.txt`" | chpasswd && \
  # Allow root login with password
  sed -i 's/prohibit-password/yes/' /etc/ssh/sshd_config && \
  echo "AllowUsers root" >> /etc/ssh/sshd_config && \
  # Clean up
  rm password.txt
# Expose SSH port
EXPOSE 22
# Add CUDA back to path during SSH
RUN echo "export PATH=$PATH:/usr/local/cuda/bin" >> /etc/profile

# Copy SSH script to set up LD_LIBRARY_PATH
COPY ssh.sh /opt/
CMD ["/opt/ssh.sh"]
