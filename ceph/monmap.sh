#!/bin/bash

# Generate monitor map
monmaptool --create --add `hostname -s` $MON_IP --fsid $UUID /tmp/monmap
# Create default data directory on monitor host
mkdir /var/lib/ceph/min/ceph-`hostname -s`
