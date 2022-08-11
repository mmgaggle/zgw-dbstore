#!/bin/bash
set -e

cat << EOF > /root/.aws/credentials
[default]
aws_access_key_id = ${ACCESS_KEY:-zippy}
aws_secret_access_key = ${SECRET_KEY:-zippy}
addressing_style = path
EOF

cat << EOF > /root/.bashrc
alias s5cmd='s5cmd --endpoint-url http://s3.default.svc.cluster.local'
EOF

if [ ${COMPONENT} == "zgw-dbstore" ]
then
  # need to test if user already exists
  radosgw-admin user create \
    --uid zippy \
    --display-name zippy \
    --access-key ${ACCESS_KEY:-zippy} \
    --secret-key ${SECRET_KEY:-zippy}

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
elif [ ${COMPONENT} == "zgw-toolbox" ]
then
  sleep infinity
fi
