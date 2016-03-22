[![Docker Pulls](https://img.shields.io/docker/pulls/kaixhin/cuda-torch.svg)](https://hub.docker.com/r/kaixhin/cuda-torch/)
[![Docker Stars](https://img.shields.io/docker/stars/kaixhin/cuda-torch.svg)](https://hub.docker.com/r/kaixhin/cuda-torch/)

cuda-torch
==========
Ubuntu Core 14.04 + [CUDA 7.0.28](http://www.nvidia.com/object/cuda_home_new.html) + [cuDNN v4](https://developer.nvidia.com/cuDNN) + [Torch7](http://torch.ch/) (including iTorch).

Requirements
------------

- Host with corresponding CUDA drivers (v. 346.46) installed for the kernel module.

Usage
-----
The container must have all NVIDIA devices attached to it for CUDA to work properly.
Therefore the command will be as such: `docker run -it --device /dev/nvidiactl --device /dev/nvidia-uvm --device /dev/nvidia0 kaixhin/cuda-torch`.
With 4 GPUs this would also have to include `--device /dev/nvidia1 --device /dev/nvidia2 --device /dev/nvidia3`.

For more information on CUDA on Docker, see the [repo readme](https://github.com/Kaixhin/dockerfiles#cuda).

To use Jupyter/iTorch open up the appropriate port. For example, use `docker run -it -p 8888:8888 <nvidia_devices> kaixhin/cuda-torch`. Then run `jupyter notebook --ip="0.0.0.0" --no-browser` to open a notebook on `localhost:8888`.

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
