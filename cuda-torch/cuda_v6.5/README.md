cuda-torch
==========
Ubuntu Core 14.04 + [CUDA 6.5.14](http://www.nvidia.com/object/cuda_home_new.html) + [Torch7](http://torch.ch/) (including iTorch).

Requirements
------------

- Host with corresponding CUDA drivers (v. 340.29) installed for the kernel module.

Usage
-----
The container must have all NVIDIA devices attached to it for CUDA to work properly.
Therefore the command will be as such: `docker run -it --device /dev/nvidiactl --device /dev/nvidia-uvm --device /dev/nvidia0 kaixhin/cuda-torch`.
With 4 GPUs this would also have to include `--device /dev/nvidia1 --device /dev/nvidia2 --device /dev/nvidia3`.

Torch is started interactively using `docker run -it <nvidia_devices> kaixhin/cuda-torch`.
The shell can be entered as usual using `docker run -it <nvidia_devices> kaixhin/cuda-torch bash`.

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
