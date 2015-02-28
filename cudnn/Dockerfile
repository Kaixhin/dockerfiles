# Start with CUDA base image
FROM kaixhin/cuda
MAINTAINER kaixhin <design@kaixhin.com>

# Set /tmp as working directory
WORKDIR /tmp
# Move cudnn archive over
ADD * ./
# Move files (allows failure for automatic builds)
RUN mv cudnn*/*.h /usr/local/cuda-6.5/include/ || true
RUN mv cudnn*/*.so* /usr/local/cuda-6.5/lib64/ || true
RUN mv cudnn*/*.a /usr/local/cuda-6.5/lib64/ || true
# Cleanup
RUN rm -rf *
# Reset working directory
WORKDIR /
