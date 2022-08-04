#!/bin/bash
set -e

radosgw-admin user create \
  --uid zippy \
  --display-name zippy \
  --access-key ${ACCESS_KEY:-zippy} \
  --secret-key ${SECRET_KEY:-zippy}

cat << EOF > /root/.aws/credentials
[default]
aws_access_key_id = ${ACCESS_KEY:-zippy}
aws_secret_access_key = ${SECRET_KEY:-zippy}
EOF

cd /var/lib/ceph

/usr/bin/radosgw \
  --cluster ceph \
  --setuser root \
  --setgroup root \
  --default-log-to-stderr=true \
  --err-to-stderr=true \
  --default-log-to-file=false \
  --foreground \
  -n client.rgw \
  --no-mon-config
