#!/bin/bash

# Generate monitor map
monmaptool --create --add `hostname -s` $MON_IP --fsid $UUID /tmp/monmap
# Create default data directory on monitor host
mkdir -p /var/lib/ceph/mon/ceph-`hostname -s`
