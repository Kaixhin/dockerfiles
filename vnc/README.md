vnc
===
Ubuntu Core 14.04 + LXDE desktop + Firefox browser + TightVNC server. Runs as a daemon by default by using tail.

Build
-----
Include password.txt with the password for TightVNC (by default this is "password"). This must be at least 8 characters.

Usage
-----
For automatically mapping a VNC port use `docker run -dP kaixhin/vnc` and `docker port <id>` to retrieve the port.
For specifying the port manually use `docker run -d -p <port>:5901 kaixhin/vnc`.
The shell can be entered as usual using `docker run -it kaixhin/vnc bash`.
