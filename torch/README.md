[![Docker Pulls](https://img.shields.io/docker/pulls/kaixhin/torch.svg)](https://hub.docker.com/r/kaixhin/torch/)
[![Docker Stars](https://img.shields.io/docker/stars/kaixhin/torch.svg)](https://hub.docker.com/r/kaixhin/torch/)

torch
=====
Ubuntu Core 14.04 + [Torch7](http://torch.ch/) (including iTorch).

Usage
-----
To use Jupyter/iTorch open up the appropriate port. For example, use `docker run -it -p 8888:8888 kaixhin/torch`. Then run `jupyter notebook --ip="0.0.0.0" --no-browser` to open a notebook on `localhost:8888`.

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
