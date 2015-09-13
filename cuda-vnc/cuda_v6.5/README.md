cuda-vnc
========
Ubuntu Core 14.04 + [CUDA 6.5.14](http://www.nvidia.com/object/cuda_home_new.html) + LXDE desktop + Firefox browser + TightVNC server.

Requirements
------------

- Host with corresponding CUDA drivers (v. 340.29) installed for the kernel module.

Build
-----
Include password.txt with the password for TightVNC (by default this is "password"). This must be at least 8 characters and is truncated if longer.

Usage
-----
The container must have all NVIDIA devices attached to it for CUDA to work properly.
Therefore the command will be as such: `docker run -dP --device /dev/nvidiactl --device /dev/nvidia-uvm --device /dev/nvidia0 kaixhin/cuda-vnc`.
With 4 GPUs this would also have to include `--device /dev/nvidia1 --device /dev/nvidia2 --device /dev/nvidia3`.

The default password should be changed. To do so start up a container and then run `docker exec <id> bash -c "echo -e '<password>\n<password>\nn' | vncpasswd"`.

For automatically mapping a VNC port use `docker run -dP <nvidia_devices> kaixhin/cuda-vnc` and `docker port <id>` to retrieve the port.
For specifying the port manually use `docker run -d -p <port>:5901 <nvidia_devices> kaixhin/cuda-vnc`.
The shell can be entered as usual using `docker run -it <nvidia_devices> kaixhin/cuda-vnc bash`.

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
