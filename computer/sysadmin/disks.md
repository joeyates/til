# /etc/fstab

{{device}} {{mount point}} {{type}} {{defaults}} {{??}} {{??}}

* device: can be device path (e.g. /dev/sda2),
  or the partition UUID (discoverable via blkid)

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

## Mount a disk with fstab

get partition and type:

```
blkid
```

```
mkdir {{PATH}}
```

Edit /etc/fstab:

```
{{UUID}} {{PATH}} ext4 defaults 0 0
```

mount {{PATH}}

## Mount a disk manually

As above, blkid and mkdir, then:

```shell
mount -t TYPE DEVICE MOUNT_POINT OPTIONS
```
