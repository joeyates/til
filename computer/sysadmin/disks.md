# Cookbook

## List partitions (mounted or unmounted)

```shell
cat /proc/partitions
```

## List file systems of partitions

```shell
blkid
```

## Create an ext4 partition

```
fdisk DEVICE

n (new)
p (primary)
1 (partition number)
(enter - first sector)
(enter - last sector)
w (write changes)

fdisk -l # get the partition number

mkfs -t ext4 PARTITION
```

## Mount a disk

```shell
mount -t TYPE DEVICE MOUNT_POINT
```
