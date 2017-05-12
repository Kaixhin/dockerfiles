# Start with CUDA DIGITS dependencies
FROM kaixhin/cuda-digits-deps:7.5
MAINTAINER Kai Arulkumaran <design@kaixhin.com>

# Move into NVIDIA Caffe repo
RUN cd /root/caffe && \
# Make and move into build directory
  mkdir build && cd build && \
# CMake
  cmake .. && \
# Make
  make -j"$(nproc)"
# Set CAFFE_HOME
ENV CAFFE_HOME /root/caffe

# Clone DIGITS repo and move into it
RUN cd /root && git clone https://github.com/NVIDIA/DIGITS.git digits && cd digits && \
# pip install
  pip install -r requirements.txt

# Enable volumes for host persistence
VOLUME /data
VOLUME /jobs

ENV DIGITS_JOBS_DIR=/jobs
ENV DIGITS_LOGFILE_FILENAME=/jobs/digits.log

# Expose server port
EXPOSE 5000
# Set working directory
WORKDIR /root/digits
# Start server
CMD ["./digits-devserver"]
