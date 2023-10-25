#!/bin/bash

if [[ $(podman ps -a -f "status=running,name=zgw" --format="{{.ID}}") ]] ; then
  podman kill zgw
  podman rm zgw
else
  echo "zgw container is not running"
fi
