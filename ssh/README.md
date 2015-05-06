ssh
===
Ubuntu Core 14.04 + SSH server.

Build
-----
Include password.txt with the password for sshd (by default this is "password").

Usage
-----
The default password should be changed. To do so start up a container and then run `docker exec <id> bash -c "echo 'root:<password>' | chpasswd"`.

For automatically mapping a SSH port use `docker run -dP kaixhin/ssh` and `docker port <id>` to retrieve the port.
For specifying the port manually use `docker run -d -p <port>:22 kaixhin/ssh`.
The shell can be entered as usual using `docker run -it kaixhin/ssh bash`.

Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
