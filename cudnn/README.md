cudnn
=====
Ubuntu Core 14.04 + CUDA 6.5.14 + cuDNN. Has the same requirements as the base [CUDA image](https://registry.hub.docker.com/u/kaixhin/cuda/).

Build
-----
Include [cuDNN](https://developer.nvidia.com/cuDNN) archive. Requires joining the CUDA Registered Developer programme.

Usage
-----
The container must have all NVIDIA devices attached to it for CUDA to work properly.
Therefore the command will be as such: `docker run -it --device /dev/nvidiactl:/dev/nvidiactl --device /dev/nvidia-uvm:/dev/nvidia-uvm --device /dev/nvidia0:/dev/nvidia0 kaixhin/cuda`.
With 4 GPUs this would also have to include `--device /dev/nvidia1:/dev/nvidia1 --device /dev/nvidia2:/dev/nvidia2 --device /dev/nvidia3:/dev/nvidia3`.
