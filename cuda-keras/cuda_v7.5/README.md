[![Docker Pulls](https://img.shields.io/docker/pulls/kaixhin/cuda-keras.svg)](https://hub.docker.com/r/kaixhin/cuda-keras/)
[![Docker Stars](https://img.shields.io/docker/stars/kaixhin/cuda-keras.svg)](https://hub.docker.com/r/kaixhin/cuda-keras/)

cuda-keras
==========
Ubuntu Core 14.04 + [CUDA 7.5](http://www.nvidia.com/object/cuda_home_new.html) + [cuDNN v4](https://developer.nvidia.com/cuDNN) + [Keras](http://keras.io/).

Requirements
------------

- [NVIDIA Docker](https://github.com/NVIDIA/nvidia-docker) - see [requirements](https://github.com/NVIDIA/nvidia-docker/wiki/CUDA#requirements) for more details.

Usage
-----
With the NVIDIA Docker plugin running, the command will be as such: ``docker run -it `curl -s localhost:3476/docker/cli` kaixhin/cuda-keras``.

For more information on CUDA on Docker, see the [repo readme](https://github.com/Kaixhin/dockerfiles#cuda).

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
