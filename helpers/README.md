Helpers
=======

The scripts in these folder can provide extra functionality, e.g. SSH, to daemonised containers.

ssh
---

When daemonising the container, make sure to expose port 22, i.e. use `-p 22`. Once the container has started, run ``docker exec -it <container> sh -c "`cat ./ssh.sh`"`` in this folder to set a password for the root user and set up SSH.

vnc
---

When daemonising the container, make sure to expose port 5901, i.e. use `-p 5901`. Once the container has started, run ``docker exec -it <container> sh -c "`cat ./vnc.sh`"`` in this folder to set up VNC with a password.
