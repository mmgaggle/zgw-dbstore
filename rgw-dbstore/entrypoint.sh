#!/bin/bash
set -e

/usr/bin/radosgw --cluster ceph --setuser ceph --setgroup ceph --default-log-to-stderr=true --err-to-stderr=true --default-log-to-file=false --foreground -n client.rgw --no-mon-config
