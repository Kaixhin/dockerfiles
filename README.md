[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE.md)

dockerfiles
===========

Compilation of Dockerfiles with automated builds enabled on the [Docker Hub](https://hub.docker.com/u/kaixhin/). **Not suitable for production environments.** These images are under continuous development, so breaking changes may be introduced.

Nearly all images are based on Ubuntu Core 14.04 LTS, built with minimising size/layers and [best practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/) in mind. Dependencies are indicated left to right e.g. cuda-vnc is VNC built on top of CUDA. Explicit dependencies are excluded.

<!--
Up-to-date builds
-----------------

Some builds based on certain software have builds that are triggered on schedule via a cron script to stay up to date on a weekly basis. These are:

- [Brainstorm](https://github.com/IDSIA/brainstorm)
- [Caffe](https://github.com/BVLC/caffe)
- [DIGITS](https://github.com/NVIDIA/DIGITS)
- [FGLab](https://github.com/Kaixhin/FGLab)/[FGMachine](https://github.com/Kaixhin/FGMachine)
- [Keras](https://github.com/fchollet/keras)
- [Lasagne](https://github.com/Lasagne/Lasagne)
- [MXNet](https://github.com/dmlc/mxnet)
- [neon](https://github.com/NervanaSystems/neon)
- [Pylearn2](https://github.com/lisa-lab/pylearn2)
- [Theano](https://github.com/Theano/Theano)
- [Torch](https://github.com/torch/distro)
-->

Graphical applications
----------------------

Starting graphical (X11) applications is possible with the following commands:

```sh
docker run -it `# Running interactively, but can be replaced with -d for daemons` \
  -e DISPLAY `# Pass $DISPLAY` \
  -v=/tmp/.X11-unix:/tmp/.X11-unix `# Pass X11 socket` \
  --ipc=host `# Allows MIT-SHM` \
  <image>
```

General information on running desktop applications with Docker can be found [in this blog post](https://blog.jessfraz.com/post/docker-containers-on-the-desktop/). You probably will also need to configure the X server host (`xhost`) to [give access](http://wiki.ros.org/docker/Tutorials/GUI). For hardware acceleration on Linux, it is possible to use `nvidia-docker` (with an image built for NVIDIA Docker), although OpenGL is [not fully supported](https://github.com/NVIDIA/nvidia-docker/issues/11).

On Mac OS X, use XQuartz and [allow connections from network clients](https://blogs.oracle.com/OracleWebCenterSuite/entry/running_gui_applications_on_docker). Then the following can be used:

```sh
docker run -it \
  -e DISPLAY=`ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'`:0 `# Use XQuartz network $DISPLAY` \
  --ipc=host \
  <image>
```

Daemonising containers
----------------------

Most containers run as a foreground process. To daemonise (in Docker terminology, detach) such a container it is possible to use:

`docker run -d <image> sh -c "while true; do sleep 1; done"`

It is now possible to access the daemonised container, for example using bash:

`docker exec -it <id> bash`

Sibling containers
------------------

To start containers on the host from within a docker container, the container requires `docker-engine` installed, with the same API version as the Docker daemon on the host. The Docker socket also needs to be mounted inside the container:

`-v /var/run/docker.sock:/var/run/docker.sock`

CUDA
----

Many images rely on [CUDA](http://www.nvidia.com/object/cuda_home_new.html). These images are versioned with the corresponding tags, e.g. "8.0" and "7.5", on the Docker Hub.

These images need to be run on an Ubuntu host OS with [NVIDIA Docker](https://github.com/NVIDIA/nvidia-docker) installed. The driver requirements can be found on the [NVIDIA Docker wiki](https://github.com/NVIDIA/nvidia-docker/wiki/CUDA#requirements).

Deprecated images
-----------------

`kaixhin/cuda` and `kaixhin/cudnn` have now been **deprecated** in favour of the official solution ([`nvidia/cuda`](https://hub.docker.com/r/nvidia/cuda/)).

Migration
---------

In the future it will hopefully be possible to checkpoint and restore Docker containers easily using [CRIU](http://criu.org/Docker). This would alleviate some issues, such as the inability to restart a VNC image successfully.

Automated Builds
----------------

[Automated Builds](https://docs.docker.com/docker-hub/builds/) on the Docker Hub have several advantages, including reproducibility and security. However the build cluster has the following limits for Automated Builds:

- 2 hours
- 1 CPU
- 2 GB RAM
- 512 MB swap
- 30 GB disk space

The main tip for keeping within the CPU and memory limits is to reduce parallelism/forking processes. Due to their logging system, redirecting stdout/stderr to /dev/null can potentially save a reasonable amount of memory.

Acknowledgements
----------------

Some Dockerfiles have been modified from the work of others. The source for these are:

- [CUDA](https://github.com/tleyden/docker)
- [Samba](https://github.com/dperson/samba)
- [VNC](https://github.com/dockerfile/ubuntu-desktop)

Citation
--------

If you find this useful in research please consider [citing this work](CITATION.md).
