# Start with Ubuntu base image
FROM ubuntu:14.04
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Clone neon repo and move into it
RUN cd root && git clone https://github.com/NervanaSystems/neon.git && cd neon && \
# Make
  make -j"$(nproc)" install
# Set ~/neon as working directory
WORKDIR /root/neon

# Run neon
CMD ["neon"]
