# Failed to find loop device

```
FATAL:   container creation failed: mount /proc/self/fd/3->/var/lib/singularity/mnt/session/rootfs error: while mounting image /proc/self/fd/3: failed to find loop device: could not attach image file to loop device: no loop devices available
```

The solution (from [here](https://github.com/sylabs/singularity/issues/1499#issuecomment-1493282259))
is to edit [/etc/singularity/singularity.conf](https://docs.sylabs.io/guides/latest/admin-guide/configfiles.html#singularity-conf) 
and 

  1. Do not use (Singularity 3.11)[https://github.com/sylabs/singularity/issues/1669#issuecomment-1543598933],
     upgrade to a newer version instead
  2. (maybe not useful) allow the sharing of loop devices
  3. (maybe not useful) increase the number of loop devices
  4. (no idea how) grant `loop` access

This can be done by 

  1. run [this script](scripts/update_singularity_due_to_loop_device.sh):

```
sudo ./scripts/update_singularity_due_to_loop_device.sh
```


  2. run [this script](scripts/allow_sharing_of_loop_devices.sh):

```
sudo ./scripts/allow_sharing_of_loop_devices.sh
```

  3. run [this script](scripts/increase_number_of_loop_devices.sh):

```
sudo ./scripts/increase_number_of_loop_devices.sh
```



