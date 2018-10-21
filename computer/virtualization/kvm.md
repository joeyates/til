# [Qemu][qemu-home]

* [Wikibook][qemu-wikibook]
* [Manual][qemu-manual]

[qemu-home]: http://wiki.qemu.org/Main_Page
[qemu-wikibook]: http://en.wikibooks.org/wiki/QEMU
[qemu-manual]: http://wiki.qemu.org/Manual

# Installation

```shell
# aptitude install qemu-kvm
```

# Setup

## Set up you user in the host

```shell
$ sudo useradd {user} {libvirt-qemu}
$ sudo useradd {user} {kvm}
```

Log out and in again.

# Decide which `qemu-system-...` to use

There is no longer a `qemu` binary. You have to choose which you want to use
based on your processor

```shell
uname -m
```

* `x86_64` - `qemu-system-x86_64`

# Create a symlink to my system's `qemu-system-...`

```shell
(cd ~/bin && rm -f qemu-system && ln -s /usr/bin/qemu-system-x86_64 qemu-system)
```

## Is acceleration in use?

???

# Machine images

## Create

```shell
qemu-img create -f qcow2 vdisk.img 10G
```

# Launching

## Start and mount physical CD

```shell
qemu-system -enable-kvm -m 256 -hda vdisk.img -cdrom /dev/cdrom -boot d
```

Parameters:

* -m - (default 128MB) virtual RAM size.
  * Gigabytes: `10G`

## Start and mount CD image

```shell
qemu-system -enable-kvm -m 256 -hda vdisk.img -cdrom image.iso -boot d
```

## Start

```shell
qemu-system -enable-kvm -m 256 -hda vdisk.img
```

# Networkingo
* http://www.linux-kvm.org/page/Networking

## SLIRP

```
-netdev user,...
```

* no root user configuration needed
* slow
* no ICMP (ping)
* no access from outside

## TAP

* root setup needed on host
* access from outside: host, Internet and other guests

### Requirements

* brctl
* tunctl (package: uml-utilities)

### Setup

Create a bridge:

```
# brctl addbr br0
```

chmod 0666 /dev/net/tun
