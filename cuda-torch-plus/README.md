cuda-torch-plus
===============
Ubuntu Core 14.04 + [CUDA 7.0.28](http://www.nvidia.com/object/cuda_home_new.html) + [cuDNN v2 RC3](https://developer.nvidia.com/cuDNN) + [Torch7](http://torch.ch/) (including iTorch). Includes the following additional packages:

- [fblualib](https://github.com/facebook/fblualib)
- [fbtorch](https://github.com/facebook/fbtorch)
- [fbnn](https://github.com/facebook/fbnn)
- [fbcunn](https://github.com/facebook/fbcunn)
- [autobw](https://github.com/bshillingford/autobw.torch)

Requirements
------------

- Host with corresponding CUDA drivers (v. 346.46) installed for the kernel module.

Build
-----
Include the cuDNN v2 (Release Candidate 3) archive.

Usage
-----
The container must have all NVIDIA devices attached to it for CUDA to work properly.
Therefore the command will be as such: `docker run -it --device /dev/nvidiactl:/dev/nvidiactl --device /dev/nvidia-uvm:/dev/nvidia-uvm --device /dev/nvidia0:/dev/nvidia0 kaixhin/cuda-torch-plus`.
With 4 GPUs this would also have to include `--device /dev/nvidia1:/dev/nvidia1 --device /dev/nvidia2:/dev/nvidia2 --device /dev/nvidia3:/dev/nvidia3`.

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
