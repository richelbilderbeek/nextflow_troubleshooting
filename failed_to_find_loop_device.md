# Failed to find loop device

```
FATAL:   container creation failed: mount /proc/self/fd/3->/var/lib/singularity/mnt/session/rootfs error: while mounting image /proc/self/fd/3: failed to find loop device: could not attach image file to loop device: no loop devices available
```

The solution (from [here](https://github.com/sylabs/singularity/issues/1499#issuecomment-1493282259))
is to edit [/etc/singularity/singularity.conf](https://docs.sylabs.io/guides/latest/admin-guide/configfiles.html#singularity-conf) 
and 

  1. allow the sharing of loop devices
  2. increase the number of loop devices
  3. 

This can be done by 

  1. run [this script](scripts/allow_sharing_of_loop_devices.sh) 
  2. run [this script](scripts/increase_number_of_loop_devices.sh)

```
sudo ./scripts/allow_sharing_of_loop_devices.sh
sudo ./scripts/increase_number_of_loop_devices.sh
```



