[![Docker Pulls](https://img.shields.io/docker/pulls/kaixhin/samba.svg)](https://hub.docker.com/r/kaixhin/samba/)
[![Docker Stars](https://img.shields.io/docker/stars/kaixhin/samba.svg)](https://hub.docker.com/r/kaixhin/samba/)

samba
=====
Ubuntu Core 14.04 + Samba server.

Build
-----
Include password.txt with the password for smbd (by default this is "password").

Usage
-----
The default password should be changed. To do so start up a container and then run `docker exec <id> bash -c "echo -e '<password>\n<password>\n' | smbpasswd -s"`.

The user is "root" and the domain is "WORKGROUP". The folder you wish to share should be mounted under /data in the container.
Specify the ports manually using `docker run -itd -p 137-139:137-139 -p 445:445 -v <share>:/data kaixhin/samba`.
The shell can be entered as usual using `docker run -it kaixhin/samba bash`.

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
