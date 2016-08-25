[![Docker Pulls](https://img.shields.io/docker/pulls/kaixhin/cuda-vnc.svg)](https://hub.docker.com/r/kaixhin/cuda-vnc/)
[![Docker Stars](https://img.shields.io/docker/stars/kaixhin/cuda-vnc.svg)](https://hub.docker.com/r/kaixhin/cuda-vnc/)

cuda-vnc
========
Ubuntu Core 14.04 + [CUDA 8.0](http://www.nvidia.com/object/cuda_home_new.html) + LXDE desktop + Firefox browser + TightVNC server.

Requirements
------------

- [NVIDIA Docker](https://github.com/NVIDIA/nvidia-docker) - see [requirements](https://github.com/NVIDIA/nvidia-docker/wiki/CUDA#requirements) for more details.

Build
-----
Include password.txt with the password for TightVNC (by default this is "password"). This must be at least 8 characters and is truncated if longer.

Usage
-----
Use NVIDIA Docker: ``nvidia-docker run -dP kaixhin/cuda-vnc``.

The default password should be changed. To do so start up a container and then run `docker exec <id> bash -c "echo -e '<password>\n<password>\nn' | vncpasswd"`.

For automatically mapping a VNC port use ``nvidia-docker run -dP kaixhin/cuda-vnc`` and `docker port <id>` to retrieve the port.
For specifying the port manually use ``nvidia-docker run -d -p <port>:5901 kaixhin/cuda-vnc``.
The shell can be entered as usual using ``nvidia-docker run -it kaixhin/cuda-vnc bash``.

For more information on CUDA on Docker, see the [repo readme](https://github.com/Kaixhin/dockerfiles#cuda).

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
