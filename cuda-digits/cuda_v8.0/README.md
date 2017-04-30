[![Docker Pulls](https://img.shields.io/docker/pulls/kaixhin/cuda-digits.svg)](https://hub.docker.com/r/kaixhin/cuda-digits/)
[![Docker Stars](https://img.shields.io/docker/stars/kaixhin/cuda-digits.svg)](https://hub.docker.com/r/kaixhin/cuda-digits/)

cuda-digits
===========
Ubuntu Core 14.04 + [CUDA 8.0](http://www.nvidia.com/object/cuda_home_new.html) + [cuDNN v6](https://developer.nvidia.com/cuDNN) + [Caffe](http://caffe.berkeleyvision.org/) (NVIDIA fork) + [DIGITS](https://developer.nvidia.com/digits).

Requirements
------------

- [NVIDIA Docker](https://github.com/NVIDIA/nvidia-docker) - see [requirements](https://github.com/NVIDIA/nvidia-docker/wiki/CUDA#requirements) for more details.

Usage
-----
Use NVIDIA Docker: ``nvidia-docker run -dP kaixhin/cuda-digits``.

For automatically mapping the DIGITS server port use ``nvidia-docker run -dP kaixhin/cuda-digits`` and `docker port <id>` to retrieve the port.
For specifying the port manually use ``nvidia-docker run -d -p <port>:5000 kaixhin/cuda-digits``.
The shell can be entered as usual using ``nvidia-docker run -it kaixhin/cuda-digits bash``.

For more information on CUDA on Docker, see the [repo readme](https://github.com/Kaixhin/dockerfiles#cuda).

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
