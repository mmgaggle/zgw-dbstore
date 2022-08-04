#!/bin/bash
set -e

cd /var/lib/ceph

/usr/bin/radosgw --cluster ceph --setuser root --setgroup root --default-log-to-stderr=true --err-to-stderr=true --default-log-to-file=false --foreground -n client.rgw --no-mon-config
