cuda-torch-plus
===============
Ubuntu Core 14.04 + [CUDA 7.5](http://www.nvidia.com/object/cuda_home_new.html) + [cuDNN v4](https://developer.nvidia.com/cuDNN) + [Torch7](http://torch.ch/) (including iTorch). Includes the following additional packages:

- [alewrap](https://github.com/Kaixhin/alewrap)
- [autograd](https://github.com/twitter/torch-autograd)
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

- [NVIDIA Docker](https://github.com/NVIDIA/nvidia-docker) - see [requirements](https://github.com/NVIDIA/nvidia-docker/wiki/CUDA#requirements) for more details.

Usage
-----
Use NVIDIA Docker: ``nvidia-docker run -it kaixhin/cuda-torch``.

For more information on CUDA on Docker, see the [repo readme](https://github.com/Kaixhin/dockerfiles#cuda).

To use Jupyter/iTorch open up the appropriate port. For example, use ``nvidia-docker run -it -p 8888:8888 kaixhin/cuda-torch``. Then run `jupyter notebook --ip="0.0.0.0" --no-browser` to open a notebook on `localhost:8888`.

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
