[![Docker Pulls](https://img.shields.io/docker/pulls/kaixhin/cuda-brainstorm.svg)](https://hub.docker.com/r/kaixhin/cuda-brainstorm/)
[![Docker Stars](https://img.shields.io/docker/stars/kaixhin/cuda-brainstorm.svg)](https://hub.docker.com/r/kaixhin/cuda-brainstorm/)

cuda-brainstorm
===============
Ubuntu Core 14.04 + [CUDA 7.5.18](http://www.nvidia.com/object/cuda_home_new.html) + [Brainstorm](https://github.com/IDSIA/brainstorm).

Requirements
------------

- Host with corresponding CUDA drivers (v. 352.39) installed for the kernel module.

Usage
-----
The container must have all NVIDIA devices attached to it for CUDA to work properly.
Therefore the command will be as such: `docker run -it --device /dev/nvidiactl --device /dev/nvidia-uvm --device /dev/nvidia0 kaixhin/cuda-brainstorm`.
With 4 GPUs this would also have to include `--device /dev/nvidia1 --device /dev/nvidia2 --device /dev/nvidia3`.

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
