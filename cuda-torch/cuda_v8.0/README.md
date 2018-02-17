[![Docker Pulls](https://img.shields.io/docker/pulls/kaixhin/cuda-torch.svg)](https://hub.docker.com/r/kaixhin/cuda-torch/)
[![Docker Stars](https://img.shields.io/docker/stars/kaixhin/cuda-torch.svg)](https://hub.docker.com/r/kaixhin/cuda-torch/)

cuda-torch
==========
Ubuntu Core 14.04 + [CUDA 8.0](http://www.nvidia.com/object/cuda_home_new.html) + [cuDNN v6](https://developer.nvidia.com/cuDNN) + [Torch7](http://torch.ch/) (including iTorch).

Requirements
------------

- [NVIDIA Docker](https://github.com/NVIDIA/nvidia-docker) - see [requirements](https://github.com/NVIDIA/nvidia-docker/wiki/CUDA#requirements) for more details.

Usage
-----
Use NVIDIA Docker: ``nvidia-docker run -it kaixhin/cuda-torch``.

For more information on CUDA on Docker, see the [repo readme](https://github.com/Kaixhin/dockerfiles#cuda).

To use Jupyter/iTorch open up the appropriate port. For example, use ``nvidia-docker run -it -p 8888:8888 kaixhin/cuda-torch``. Then run `jupyter notebook --ip="0.0.0.0" --no-browser --allow-root` to open a notebook on `localhost:8888`.

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
