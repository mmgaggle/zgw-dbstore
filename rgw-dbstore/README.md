# Building

```
podman build -t rgw-dbstore ./
```

# Running with Podman

```
podman run -it rgw-dbstore:latest \
  -v /mnt:/var/lib/ceph \
  -e ACCESS_KEY=$ACCESS_KEY \
  -e SECRET_KEY=$SECRET_KEY
```

# Enter zgw container

```
podman exec -it <container id> /bin/bash
```

# Create a bucket
```
s5cmd --endpoint-url http://127.0.0.1:7480 mb s3://warp-benchmark
```

# Run warp benchmark
```
warp put --host 127.0.0.1:7480 \
         --access-key zippy \
         --secret-key zippy \
         --duration 10s
```
