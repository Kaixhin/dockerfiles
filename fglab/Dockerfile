# Start with Node.js base image
FROM node
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install Bower
RUN npm install -g bower

# Clone FGLab repo and move into it
RUN cd /root && git clone https://github.com/Kaixhin/FGLab.git && cd FGLab && \
# npm install
  npm install && \
# Bower install
  bower install --allow-root && \
# Create .env with port
  echo "PORT=5000" > .env

# Expose port
EXPOSE 5000
# Set working directory
WORKDIR /root/FGLab
# Start server
ENTRYPOINT ["node", "index.js"]
