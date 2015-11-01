[![Docker Pulls](https://img.shields.io/docker/pulls/kaixhin/cuda-pylearn2.svg)](https://hub.docker.com/r/kaixhin/cuda-pylearn2/)
[![Docker Stars](https://img.shields.io/docker/stars/kaixhin/cuda-pylearn2.svg)](https://hub.docker.com/r/kaixhin/cuda-pylearn2/)

cuda-pylearn2
=============
Ubuntu Core 14.04 + [CUDA 7.0.28](http://www.nvidia.com/object/cuda_home_new.html) + [Pylearn2](http://deeplearning.net/software/pylearn2/).

Requirements
------------

- Host with corresponding CUDA drivers (v. 346.46) installed for the kernel module.

Usage
-----
The container must have all NVIDIA devices attached to it for CUDA to work properly.
Therefore the command will be as such: `docker run -it --device /dev/nvidiactl --device /dev/nvidia-uvm --device /dev/nvidia0 kaixhin/cuda-pylearn2`.
With 4 GPUs this would also have to include `--device /dev/nvidia1 --device /dev/nvidia2 --device /dev/nvidia3`.

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
