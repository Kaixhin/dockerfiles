dockerfiles
===========

Compilation of Dockerfiles with automated builds enabled on the [Docker Hub](https://registry.hub.docker.com/repos/kaixhin/).

All images are based on Ubuntu Core 14.04 LTS, built with minimising size/layers and [best practices](https://docs.docker.com/articles/dockerfile_best-practices/) in mind.
Dependencies are indicated left to right e.g. cuda-vnc is VNC built on top of CUDA. Explicit dependencies are excluded.
CUDA images can be used without NVIDIA devices attached, but will obviously lack the ability to use CUDA capabilities.

Some builds based on certain software have builds that are triggered on schedule via a cron script to stay up to date. These are:

- Caffe (weekly)
- DIGITS (daily)
- Torch (weekly)
