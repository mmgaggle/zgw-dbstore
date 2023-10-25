#!/bin/bash

if [[ $(podman ps -a -f "status=running,name=zgw" --format="{{.ID}}") ]] ; then
  echo "zgw container already running"
else
  podman run --name zgw \
           --user 167:167 \
           -p 7480:7480 \
           -e COMPONENT=zgw-dbstore \
           -e ACCESS_KEY=${ACCESS_KEY} \
           -e SECRET_KEY=${SECRET_KEY} \
           -dt quay.io/mmgaggle/zgw-dbstore:latest
fi
