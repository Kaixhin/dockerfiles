[![Docker Pulls](https://img.shields.io/docker/pulls/kaixhin/digits.svg)](https://hub.docker.com/r/kaixhin/digits/)
[![Docker Stars](https://img.shields.io/docker/stars/kaixhin/digits.svg)](https://hub.docker.com/r/kaixhin/digits/)

digits
======
Ubuntu Core 14.04 + [Pycaffe](http://caffe.berkeleyvision.org/) (NVIDIA fork) + [DIGITS](https://developer.nvidia.com/digits) (CPU-only).

Usage
-----
For automatically mapping the DIGITS server port use `docker run -dP kaixhin/digits` and `docker port <id>` to retrieve the port.
For specifying the port manually use `docker run -d -p <port>:8080 kaixhin/digits`.
The shell can be entered as usual using `docker run -it kaixhin/digits bash`.

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
