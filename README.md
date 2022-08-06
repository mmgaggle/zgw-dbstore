# Z is for zipper

The Ceph object gateway (radosgw or rgw), provides a S3 server dialect and
persists objects in Ceph's native object store (RADOS). Zipper was the initative
to implement a layering API based on stackable modules/drivers, similar to Unix
filesystems (VFS). Sans RADOS, the rgw is the /zgw/.

This repository is intended to provide tooling to build container images for
the Ceph object gateway with the dbstore store driver, and provide configs to
run it in a Kubernetes cluster.

## Using a pre-built container in kubernetes

```
kubectl apply -f zgw-dbstore.yaml
```

## Building zgw:dbstore container

```
docker build -t rgw-dbstore docker/zgw-dbstore
```

## Running zgw-dbstore with docker

Set environmental variables if you want to override the default set of
credentials for the `zippy` user.

```
podman run -it rgw-dbstore:latest \
  -v /mnt:/var/lib/ceph \
  -e ACCESS_KEY=$ACCESS_KEY \
  -e SECRET_KEY=$SECRET_KEY
```

# Playing with zgw:dbstore

## Enter zgw pod

```
kubectl rsh po zgw-dbstore
```

## Enter zgw container

```
podman exec -it <container id> /bin/bash
```

## Using s5cmd

The container entrypoint sets up credentials for s5cmd, you still need to pass
the endpoint.

```
s5cmd --endpoint-url http://127.0.0.1:7480 mb s3://warp-benchmark
```

## Run warp benchmark
```
warp put --host 127.0.0.1:7480 \
         --access-key zippy \
         --secret-key zippy \
         --duration 10s
```
