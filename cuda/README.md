cuda
====
Ubuntu Core 14.04 + [CUDA 7.0.28](http://www.nvidia.com/object/cuda_home_new.html).

Requirements
------------

- Host with corresponding CUDA drivers (v. 346.46) installed for the kernel module.

Usage
-----
The container must have all NVIDIA devices attached to it for CUDA to work properly.
Therefore the command will be as such: `docker run -it --device /dev/nvidiactl:/dev/nvidiactl --device /dev/nvidia-uvm:/dev/nvidia-uvm --device /dev/nvidia0:/dev/nvidia0 kaixhin/cuda`.
With 4 GPUs this would also have to include `--device /dev/nvidia1:/dev/nvidia1 --device /dev/nvidia2:/dev/nvidia2 --device /dev/nvidia3:/dev/nvidia3`.

Samples
-------

As the image is intended to be lightweight, the CUDA samples were not installed. If you wish to experiment with the samples you will need to install them yourself. The steps are as below:
```
wget http://developer.download.nvidia.com/compute/cuda/7_0/Prod/local_installers/cuda_7.0.28_linux.run
chmod +x cuda_*_linux.run
./cuda_*_linux.run -extract=`pwd`
./cuda-samples-linux-*.run -noprompt
```
Please note that you may need to install other packages in order to compile some of the CUDA samples.

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
