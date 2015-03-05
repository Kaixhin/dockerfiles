# Start with Node.js base image
FROM node
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install localtunnel
RUN npm install -g localtunnel
# Entrypoint takes port to forward
ENTRYPOINT ["usr/local/bin/lt", "--port"]
