# General Info

libvirt is "a toolkit to manage virtualization platforms"

Images: /var/lib/libvirt/images

# Installation

```shell
# aptitude install libvirt-bin
```

# Setup

## Set up you user in the host

```shell
$ sudo useradd {user} {libvirt-qemu}
```

## Check your user can use virtualization

If you see this:
"system policy prevents management of local virtualized systems"

edit /etc/libvirt/libvirtd.conf:
```conf
auth_unix_ro = "none"
auth_unix_rw = "none"
```

Restart libvirtd:
```shell
# service libvirtd restart
```

Ensure group permissions on /var/run/libvirt/libvirt-sock are for
libvirt-qemu

# virsh

## domains

"domains" are guest machines.

* `virsh help domain` - get topic help
* `virsh list` - list running domains
* `virsh list --all` - list all domains
* `virsh undefine <domain>`

## pools

```
$ virsh pool-list
```

## volumes

* `virsh help volume` - get topic help
* `virsh vol-list <POOL NAME>`
* `virsh vol-delete --pool <POOL NAME> <VOLUME NAME>`

## snapshots

https://www.cyberciti.biz/faq/how-to-create-create-snapshot-in-linux-kvm-vmdomain/
https://unix.stackexchange.com/questions/222427/how-to-create-custom-vagrant-box-from-libvirt-kvm-instance

* run machine
* make changes
* create snapshot

* `virsh help snapshot` - get topic help
* `virsh snapshot-list <domain>` - list guest snapshots
* `virsh snapshot-create-as --domain <domain> --name <snapshot name>` -
  create a snapshot
* `virsh snapshot-revert <domain> <snapshot name>` - revert to a snapshot
* `virsh snapshot-delete <domain> --snapshotname <string>`

## network

* `virsh help network` - get topic help
* `virsh net-list`

https://github.com/nest/anubis-puppet/blob/master/manifests/files/common/network-restart
