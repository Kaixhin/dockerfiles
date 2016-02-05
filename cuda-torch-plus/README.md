cuda-torch-plus
===============
Ubuntu Core 14.04 + [CUDA 7.5.18](http://www.nvidia.com/object/cuda_home_new.html) + [cuDNN v2 RC4](https://developer.nvidia.com/cuDNN) + [Torch7](http://torch.ch/) (including iTorch). Installs the latest versions of `nn`, `cutorch`, and `cunn`. Includes the following additional packages:

- [alewrap](https://github.com/Kaixhin/alewrap)
- [autograd](https://github.com/twitter/torch-autograd)
- [cjson](https://github.com/mpx/lua-cjson)
- [classic](https://github.com/deepmind/classic)
- [cudnn](https://github.com/soumith/cudnn.torch)
- [dataset](https://github.com/twitter/torch-dataset)
- [distlearn](https://github.com/twitter/torch-distlearn)
- [dpnn](https://github.com/Element-Research/dpnn)
- [ffmpeg](https://github.com/clementfarabet/lua---ffmpeg)
- [imagine-nn](https://github.com/szagoruyko/imagine-nn)
- [ipc](https://github.com/twitter/torch-ipc)
- [loadcaffe](https://github.com/szagoruyko/loadcaffe)
- [logroll](https://github.com/rosejn/logroll)
- [LuaSocket](https://github.com/diegonehab/luasocket)
- [Moses](https://github.com/Yonaba/Moses)
- [nccl](https://github.com/ngimel/nccl.torch)
- [nninit](https://github.com/Kaixhin/nninit)
- [nnquery](https://github.com/bshillingford/nnquery)
- [parallel](https://github.com/clementfarabet/lua---parallel)
- [rlenvs](https://github.com/Kaixhin/rlenvs)
- [rnn](https://github.com/Element-Research/rnn)
- [stn](https://github.com/qassemoquab/stnbhwd)
- [torchx](https://github.com/nicolas-leonard/torchx)
- [xitari](https://github.com/Kaixhin/xitari)

Requirements
------------

- Host with corresponding CUDA drivers (v. 352.39) installed for the kernel module.

Usage
-----
The container must have all NVIDIA devices attached to it for CUDA to work properly.
Therefore the command will be as such: `docker run -it --device /dev/nvidiactl --device /dev/nvidia-uvm --device /dev/nvidia0 kaixhin/cuda-torch-plus`.
With 4 GPUs this would also have to include `--device /dev/nvidia1 --device /dev/nvidia2 --device /dev/nvidia3`.

For more information on CUDA on Docker, see the [repo readme](https://github.com/Kaixhin/dockerfiles#cuda).

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
