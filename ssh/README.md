ssh
===
Ubuntu Core 14.04 + SSH server.

Build
-----
Include password.txt with the password for sshd (by default this is "password").

Usage
-----
For automatically mapping a SSH port use `docker run -dP kaixhin/ssh` and `docker port <id>` to retrieve the port.
For specifying the port manually use `docker run -d -p <port>:22 kaixhin/ssh`.
The shell can be entered as usual using `docker run -it kaixhin/ssh bash`.
