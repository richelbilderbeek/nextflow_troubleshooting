# Failed to find loop device

```
FATAL:   container creation failed: mount /proc/self/fd/3->/var/lib/singularity/mnt/session/rootfs error: while mounting image /proc/self/fd/3: failed to find loop device: could not attach image file to loop device: no loop devices available
```

The solution (from [here](https://github.com/sylabs/singularity/issues/1499#issuecomment-1493282259))
is to edit singularity.conf and allowed the sharing of loop devices.

