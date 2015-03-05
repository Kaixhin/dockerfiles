localtunnel
===========
Node.js + [localtunnel](http://localtunnel.me/).

Usage
-----
**Note that this is only for forwarding HTTP(S) traffic.**

Enter the port to forward as the argument: `docker run -d kaixhin/localtunnel <port>`.
Use `docker logs <container id>` to find out the address of your forwarded port.
