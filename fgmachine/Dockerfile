# Start with Node.js base image
FROM node
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install docker
RUN curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.10.3 > /usr/bin/docker && chmod +x /usr/bin/docker

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
