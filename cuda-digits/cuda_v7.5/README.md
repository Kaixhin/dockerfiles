[![Docker Pulls](https://img.shields.io/docker/pulls/kaixhin/cuda-digits.svg)](https://hub.docker.com/r/kaixhin/cuda-digits/)
[![Docker Stars](https://img.shields.io/docker/stars/kaixhin/cuda-digits.svg)](https://hub.docker.com/r/kaixhin/cuda-digits/)

cuda-digits
===========
Ubuntu Core 14.04 + [CUDA 7.5](http://www.nvidia.com/object/cuda_home_new.html) + [cuDNN v4](https://developer.nvidia.com/cuDNN) + [Caffe](http://caffe.berkeleyvision.org/) (NVIDIA fork) + [DIGITS](https://developer.nvidia.com/digits).

Requirements
------------

- [NVIDIA Docker](https://github.com/NVIDIA/nvidia-docker) - see [requirements](https://github.com/NVIDIA/nvidia-docker/wiki/CUDA#requirements) for more details.

Usage
-----
With the NVIDIA Docker plugin running, the command will be as such: ``docker run -dP `curl -s localhost:3476/docker/cli` kaixhin/cuda-digits``.

For automatically mapping the DIGITS server port use ``docker run -dP `curl -s localhost:3476/docker/cli` kaixhin/cuda-digits`` and `docker port <id>` to retrieve the port.
For specifying the port manually use ``docker run -d -p <port>:5000 `curl -s localhost:3476/docker/cli` kaixhin/cuda-digits``.
The shell can be entered as usual using ``docker run -it `curl -s localhost:3476/docker/cli` kaixhin/cuda-digits bash``.

For more information on CUDA on Docker, see the [repo readme](https://github.com/Kaixhin/dockerfiles#cuda).

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
