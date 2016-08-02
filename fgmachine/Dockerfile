# Start with Node.js base image
FROM node
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install Docker dependencies, pciutils (for lspci) and vim (for editing)
RUN apt-get update && apt-get install -y \
  apt-transport-https \
  ca-certificates \
  pciutils \
  vim
# Add Docker GPG key
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
# Add Docker to apt sources
  echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list && \
# Install docker-engine
  apt-get update && apt-get install -y docker-engine

# Create NVIDIA Docker init file
RUN touch /etc/init.d/nvidia-docker && \
  chmod +x /etc/init.d/nvidia-docker && \
# Install NVIDIA Docker
  wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.0-rc.3/nvidia-docker_1.0.0.rc.3-1_amd64.deb && \
  dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb

# Clone FGMachine repo and move into it
RUN cd /root && git clone https://github.com/Kaixhin/FGMachine.git && cd FGMachine && \
# npm install
  npm install

# Expose port
EXPOSE 5081
# Set working directory
WORKDIR /root/FGMachine
# Start server
ENTRYPOINT ["node", "machine"]
