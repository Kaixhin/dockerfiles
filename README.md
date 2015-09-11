dockerfiles
===========

Compilation of Dockerfiles with automated builds enabled on the [Docker Hub](https://registry.hub.docker.com/repos/kaixhin/).

All images are based on Ubuntu Core 14.04 LTS, built with minimising size/layers and [best practices](https://docs.docker.com/articles/dockerfile_best-practices/) in mind. Dependencies are indicated left to right e.g. cuda-vnc is VNC built on top of CUDA. Explicit dependencies are excluded. CUDA images can be used without NVIDIA devices attached, but will obviously lack the ability to use CUDA capabilities.

Please note that these images are under continuous development, so breaking changes may be introduced. Therefore, it is not recommended to use these in a production environment without testing.

Up-to-date builds
-----------------

Some builds based on certain software have builds that are triggered on schedule via a cron script to stay up to date on a weekly basis. These are:

- [Caffe](https://github.com/BVLC/caffe)
- [DIGITS](https://github.com/NVIDIA/DIGITS)
- [neon](https://github.com/NervanaSystems/neon)
- [Theano](https://github.com/Theano/Theano)
- [Torch](https://github.com/torch/distro)

Daemonising containers
----------------------

Most containers run as a foreground process. To daemonise such a container it is possible to use:

`docker run -d <image> sh -c "while true; do :; done"`

It is now possible to access the daemonised container, for example using bash:

`docker exec -it <id> bash`

CUDA
----

Many images rely on [CUDA](http://www.nvidia.com/object/cuda_home_new.html). All images that rely on CUDA have a CUDA 7.5 version, with the "latest" tag on the Docker Hub. Some images also have CUDA 7.0 and 6.5 versions, with the "7.0" and "6.5" tags on the Docker Hub. The host must have the corresponding CUDA drivers (v352.39 for CUDA 7.5, v346.46 for CUDA 7.0, v340.29 for CUDA 6.5) installed for the kernel module. For a discussion of driver versions please see [issue #1](https://github.com/Kaixhin/dockerfiles/issues/1).

The container must have all NVIDIA devices attached to it for CUDA to work properly. Therefore the command will be as such: `docker run -it --device /dev/nvidiactl:/dev/nvidiactl --device /dev/nvidia-uvm:/dev/nvidia-uvm --device /dev/nvidia0:/dev/nvidia0 kaixhin/cuda`. With 4 GPUs this would also have to include `--device /dev/nvidia1:/dev/nvidia1 --device /dev/nvidia2:/dev/nvidia2 --device /dev/nvidia3:/dev/nvidia3`.

Helpers
-------

The scripts in these folder can provide extra functionality, e.g. SSH, to daemonised containers. Further details are available in the folder's readme.

Migration
---------

In the future it will hopefully be possible to checkpoint and restore Docker containers easily using [CRIU](http://criu.org/Docker). This would alleviate some issues, such as the inability to restart a VNC image successfully.

Acknowledgements
----------------

Some Dockerfiles have been modified from the work of others. The source for these are:

- [CUDA](https://github.com/tleyden/docker)
- [Samba](https://github.com/dperson/samba)
- [VNC](https://github.com/dockerfile/ubuntu-desktop)

Final notes
-----------

This work is released under the [MIT License](https://github.com/Kaixhin/dockerfiles/blob/master/LICENSE.md). If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
