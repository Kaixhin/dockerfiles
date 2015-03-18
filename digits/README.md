digits
======
Ubuntu Core 14.04 + CUDA 6.5.19 + PyCaffe + DiGiTS. Requires the host has the corresponding CUDA drivers installed for the kernel module.

Build
-----
Include the cuDNN v2 (Release Candidate 3) archive.

Usage
-----
The container must have all NVIDIA devices attached to it for CUDA to work properly.
Therefore the command will be as such: `docker run -it --device /dev/nvidiactl:/dev/nvidiactl --device /dev/nvidia-uvm:/dev/nvidia-uvm --device /dev/nvidia0:/dev/nvidia0 kaixhin/digits`.
With 4 GPUs this would also have to include `--device /dev/nvidia1:/dev/nvidia1 --device /dev/nvidia2:/dev/nvidia2 --device /dev/nvidia3:/dev/nvidia3`.

Note that due to the CUDA requirement the server can not be started automatically.

For automatically mapping a DiGiTS devserver use `docker run -itP <nvidia_devices> kaixhin/digits` and `docker port <id>` to retrieve the port.
For specifying the port manually use `docker run -it -p <port>:5000 <nvidia_devices> kaixhin/digits`.
