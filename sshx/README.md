[![Docker Pulls](https://img.shields.io/docker/pulls/kaixhin/sshx.svg)](https://hub.docker.com/r/kaixhin/sshx/)
[![Docker Stars](https://img.shields.io/docker/stars/kaixhin/sshx.svg)](https://hub.docker.com/r/kaixhin/sshx/)

sshx
====
Ubuntu Core 14.04 + SSH server + X server.

Usage
-----
The default password ("password") should be changed. To do so start up a container and then run `docker exec <id> bash -c "echo 'root:<password>' | chpasswd"`.

For automatically mapping a SSH port use `docker run -dP kaixhin/sshx` and `docker port <id>` to retrieve the port.
For specifying the port manually use `docker run -d -p <port>:22 kaixhin/sshx`.
The shell can be entered as usual using `docker run -it kaixhin/sshx bash`.

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
