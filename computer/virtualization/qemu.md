# General

QEMU is an emulator of computer hardware.

# [Qemu][qemu-home]

* [Wikibook][qemu-wikibook]
* [Manual][qemu-manual]

[qemu-home]: http://wiki.qemu.org/Main_Page
[qemu-wikibook]: http://en.wikibooks.org/wiki/QEMU
[qemu-manual]: http://wiki.qemu.org/Manual

# Installation

```shell
# aptitude install qemu-kvm virt-manager virtinst libvirt-clients bridge-utils libvirt-daemon-system
```

# Setup

## Set up you user in the host

```shell
sudo usermod -aG kvm $USER
sudo usermod -aG libvirt $USER
```

# Use

```sh
sudo virt-manager
```
