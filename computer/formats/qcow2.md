# Cookbook

# Resize

"Resizing" is actually copying.

Choose the partition to resize

```
virt-filesystems --long -h --all -a OLD_NAME
```

Create the new image with the desired size

Size can be '80G'

```
qemu-img create -f qcow2 -o preallocation=metadata NEW_NAME SIZE
```

Copy

```
virt-resize --expand PARTITION_TO_EXPAND OLD_NAME NEW_NAME
```
