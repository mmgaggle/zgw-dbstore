# Building

```
podman build -t rgw-dbstore ./
```

# Running with Podman

```
podman run -it rgw-dbstore:latest -v /mnt:/var/lib/ceph
```

