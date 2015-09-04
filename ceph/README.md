ceph
=====
Ubuntu Core 14.04 + [Ceph](http://ceph.com).

Usage
-----
Setup involves a few steps:

1. Generate a unique fsid with `genuuid` and save it (e.g. run ``export CEPH_UUID=`genuuid` `` on the host).
1. Create `ceph.conf` with the fsid and move it to /etc/ceph/ceph.conf on the host.
1. Run `docker run --net=host -v /etc/ceph:/etc/ceph -v /var/lib/ceph:/var/lib/ceph -e MON_IP=<public host IP> -e UUID=<ceph fsid> -it kaixhin/ceph` to start the container.
1. Set up authentication by running `/opt/auth.sh`.
1. Generate the monitor map by running `/opt/monmap.sh`.
1. Start a monitor by running `/opt/mon.sh`.




Citation
--------
If you find this useful in research please consider [citing this work](https://github.com/Kaixhin/dockerfiles/blob/master/CITATION.md).
