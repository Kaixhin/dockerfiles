cuda-ssh
========
Ubuntu Core 14.04 + [CUDA 7.0.28](http://www.nvidia.com/object/cuda_home_new.html) + SSH server + X server (for NVIDIA Visual Profiler).
Requires the host has the corresponding CUDA drivers (v. 346.46) installed for the kernel module.

Build
-----
Include password.txt with the password for sshd (by default this is "password").

Usage
-----
The container must have all NVIDIA devices attached to it for CUDA to work properly.
Therefore the command will be as such: `docker run -dP --device /dev/nvidiactl:/dev/nvidiactl --device /dev/nvidia-uvm:/dev/nvidia-uvm --device /dev/nvidia0:/dev/nvidia0 kaixhin/cuda-ssh`.
With 4 GPUs this would also have to include `--device /dev/nvidia1:/dev/nvidia1 --device /dev/nvidia2:/dev/nvidia2 --device /dev/nvidia3:/dev/nvidia3`.

The default password should be changed. To do so start up a container and then run `docker exec <id> bash -c "echo 'root:<password>' | chpasswd"`.

For automatically mapping a SSH port use `docker run -dP <nvidia_devices> kaixhin/cuda-ssh` and `docker port <id>` to retrieve the port.
For specifying the port manually use `docker run -d -p <port>:22 <nvidia_devices> kaixhin/cuda-ssh`.
The shell can be entered as usual using `docker run -it <nvidia_devices> kaixhin/cuda-ssh bash`.

The NVIDIA Visual Profiler (`nvvp`) can be accessed with an X client, after having run ssh with the `-X` flag.

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
