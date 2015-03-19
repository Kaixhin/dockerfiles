samba
=====
Ubuntu Core 14.04 + Samba server.

Build
-----
Include password.txt with the password for smbd (by default this is "password").

Usage
-----
The default password should be changed. To do so start up a container and then run `docker exec <id> bash -c "echo '<password>\n<password>\n' | smbpasswd -s"`.

For automatically mapping a SSH port use `docker run -dP kaixhin/samba` and `docker port <id>` to retrieve the port.
For specifying the port manually use `docker run -d -p <port>:137 -p <port>:138 -p <port>:139 -p <port>:445 kaixhin/samba`.
The shell can be entered as usual using `docker run -it kaixhin/samba bash`.
