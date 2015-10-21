# Start with Node.js base image
FROM node
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Clone FGLab repo and move into it
RUN cd /root && git clone https://github.com/Kaixhin/FGLab.git && cd FGLab && \
# npm install
  npm install && \
# Create .env with port
  echo "PORT=5080" > .env

# Expose port
EXPOSE 5080
# Set working directory
WORKDIR /root/FGLab
# Start server
ENTRYPOINT ["node", "index.js"]
