dockerfiles
===========

Compilation of Dockerfiles with automated builds enabled on the [Docker Hub](https://registry.hub.docker.com/repos/kaixhin/).

All images are based on Ubuntu Core 14.04 LTS, built with minimising size/layers and [best practices](https://docs.docker.com/articles/dockerfile_best-practices/) in mind.
Dependencies are indicated left to right e.g. cuda-vnc is VNC built on top of CUDA. Explicit dependencies are excluded.
CUDA images can be used without NVIDIA devices attached, but will obviously lack the ability to use CUDA capabilities.

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

`docker run -d <image> /bin/sh -c "while true; do :; done"`

It is now possible to access the daemonised container, for example using bash:

`docker exec -it <id> bash`

Migration
---------

In the future it will hopefully be possible to checkpoint and restore Docker containers easily using [CRIU](http://criu.org/Docker).
This would alleviate some issues, such as the inability to restart a VNC image successfully.

Final notes
-----------

This work is released under the [MIT License](https://github.com/Kaixhin/dockerfiles/blob/master/LICENSE.md).
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
