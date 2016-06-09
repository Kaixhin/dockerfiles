[![Docker Pulls](https://img.shields.io/docker/pulls/kaixhin/cuda-ssh.svg)](https://hub.docker.com/r/kaixhin/cuda-ssh/)
[![Docker Stars](https://img.shields.io/docker/stars/kaixhin/cuda-ssh.svg)](https://hub.docker.com/r/kaixhin/cuda-ssh/)

cuda-ssh
========
Ubuntu Core 14.04 + [CUDA 7.5](http://www.nvidia.com/object/cuda_home_new.html) + SSH server + X server (for NVIDIA Visual Profiler).

Requirements
------------

- [NVIDIA Docker](https://github.com/NVIDIA/nvidia-docker) - see [requirements](https://github.com/NVIDIA/nvidia-docker/wiki/CUDA#requirements) for more details.

Build
-----
Include password.txt with the password for sshd (by default this is "password").

Usage
-----
Use NVIDIA Docker: ``nvidia-docker run -dP kaixhin/cuda-ssh``.

The default password should be changed. To do so start up a container and then run `docker exec <id> bash -c "echo 'root:<password>' | chpasswd"`.

For automatically mapping a SSH port use ``nvidia-docker run -dP kaixhin/cuda-ssh`` and `docker port <id>` to retrieve the port.
For specifying the port manually use ``nvidia-docker run -d -p <port>:22 kaixhin/cuda-ssh``.
The shell can be entered as usual using ``nvidia-docker run -it kaixhin/cuda-ssh bash``.

The NVIDIA Visual Profiler (`nvvp`) can be accessed with an X client, after having run ssh with the `-X` flag.

For more information on CUDA on Docker, see the [repo readme](https://github.com/Kaixhin/dockerfiles#cuda).

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
