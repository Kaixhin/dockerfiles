# Start with Ubuntu base image
FROM ubuntu:14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Install git
Run apt-get update && apt-get install -y git

# Clone neon repo and move into it
RUN cd root && git clone https://github.com/NervanaSystems/neon.git && cd neon && \
# Make
  make -j"$(nproc)" install
# Set ~/neon as working directory
WORKDIR /root/neon

# Run neon
CMD ["neon"]
