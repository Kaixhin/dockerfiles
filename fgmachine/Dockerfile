# Start with Node.js base image
FROM node
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Clone FGMachine repo and move into it
RUN cd /root && git clone https://github.com/Kaixhin/FGMachine.git && cd FGMachine && \
# npm install
  npm install

# Expose port
EXPOSE 5081
# Set working directory
WORKDIR /root/FGMachine
# Start server
ENTRYPOINT ["node", "index.js"]
