#!/bin/bash

# Populate monitor daemon with monitor map and keyring
ceph-mon --mkfs -i `hostname -s` --monmap /tmp/monmap --keyring /tmp/ceph.mon.keyring
# Mark monitor as created
touch /var/lib/ceph/mon/ceph-`hostname -s`/done
# Start monitor
start ceph-mon id=`hostname -s`
