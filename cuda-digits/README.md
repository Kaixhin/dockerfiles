digits
======
Ubuntu Core 14.04 + CUDA 7.0.28 + Pycaffe + DIGITS. Requires the host has the corresponding CUDA drivers (v. 346.46) installed for the kernel module.

Build
-----
Include the cuDNN v2 (Release Candidate 3) archive.

Usage
-----
The container must have all NVIDIA devices attached to it for CUDA to work properly.
Therefore the command will be as such: `docker run -dP --device /dev/nvidiactl:/dev/nvidiactl --device /dev/nvidia-uvm:/dev/nvidia-uvm --device /dev/nvidia0:/dev/nvidia0 kaixhin/digits`.
With 4 GPUs this would also have to include `--device /dev/nvidia1:/dev/nvidia1 --device /dev/nvidia2:/dev/nvidia2 --device /dev/nvidia3:/dev/nvidia3`.

For automatically mapping the DIGITS server port use `docker run -dP <nvidia_devices> kaixhin/digits` and `docker port <id>` to retrieve the port.
For specifying the port manually use `docker run -d -p <port>:8080 <nvidia_devices> kaixhin/digits`.
The shell can be entered as usual using `docker run -it <nvidia_devices> kaixhin/digits bash`.
