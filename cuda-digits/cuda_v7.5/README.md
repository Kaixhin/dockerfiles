cuda-digits
===========
Ubuntu Core 14.04 + [CUDA 7.5.18](http://www.nvidia.com/object/cuda_home_new.html) + [Pycaffe](http://caffe.berkeleyvision.org/) (NVIDIA fork) + [DIGITS](https://developer.nvidia.com/digits).

Requirements
------------

- Host with corresponding CUDA drivers (v. 352.39) installed for the kernel module.

Usage
-----
The container must have all NVIDIA devices attached to it for CUDA to work properly.
Therefore the command will be as such: `docker run -dP --device /dev/nvidiactl --device /dev/nvidia-uvm --device /dev/nvidia0 kaixhin/cuda-digits`.
With 4 GPUs this would also have to include `--device /dev/nvidia1 --device /dev/nvidia2 --device /dev/nvidia3`.

For automatically mapping the DIGITS server port use `docker run -dP <nvidia_devices> kaixhin/cuda-digits` and `docker port <id>` to retrieve the port.
For specifying the port manually use `docker run -d -p <port>:8080 <nvidia_devices> kaixhin/cuda-digits`.
The shell can be entered as usual using `docker run -it <nvidia_devices> kaixhin/cuda-digits bash`.

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
