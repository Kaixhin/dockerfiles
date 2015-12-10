cuda-torch-plus
===============
Ubuntu Core 14.04 + [CUDA 7.5.18](http://www.nvidia.com/object/cuda_home_new.html) + [cuDNN v2 RC3](https://developer.nvidia.com/cuDNN) + [Torch7](http://torch.ch/) (including iTorch). Installs the latest versions of `nn`, `cutorch`, and `cunn`. Includes the following additional packages:

- [cjson](https://github.com/mpx/lua-cjson)
- cudnn
- [dp](https://github.com/nicolas-leonard/dp)
- [dpnn](https://github.com/nicolas-leonard/dpnn)
- [ffmpeg](https://github.com/clementfarabet/lua---ffmpeg)
- [imagine-nn](https://github.com/szagoruyko/imagine-nn)
- [loadcaffe](https://github.com/szagoruyko/loadcaffe)
- [LuaSocket](https://github.com/diegonehab/luasocket)
- [nninit](https://github.com/Kaixhin/nninit)
- [oxnn](https://github.com/tkocisky/oxnn)
- [parallel](https://github.com/clementfarabet/lua---parallel)
- [rnn](https://github.com/Element-Research/rnn)
- [stn](https://github.com/qassemoquab/stnbhwd)
- [torchx](https://github.com/nicolas-leonard/torchx)

Requirements
------------

- Host with corresponding CUDA drivers (v. 352.39) installed for the kernel module.

Build
-----
Include the cuDNN v3 archive.

Usage
-----
The container must have all NVIDIA devices attached to it for CUDA to work properly.
Therefore the command will be as such: `docker run -it --device /dev/nvidiactl --device /dev/nvidia-uvm --device /dev/nvidia0 kaixhin/cuda-torch-plus`.
With 4 GPUs this would also have to include `--device /dev/nvidia1 --device /dev/nvidia2 --device /dev/nvidia3`.

For more information on CUDA on Docker, see the [repo readme](https://github.com/Kaixhin/dockerfiles#cuda).

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
