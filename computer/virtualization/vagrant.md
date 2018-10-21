# Basic Info

* ~/.vagrant.d - configuration
* ~/.vagrant.d/boxes/ - boxes

# Setup

```shell
aptitude install vagrant
```

# Vagrant + Kvm

## Install

```shell
# aptitude install qemu-utils qemu

$ kvm-ok
```

Download latest Vagrant:
https://releases.hashicorp.com/vagrant/

```
$ curl -O https://releases.hashicorp.com/vagrant/2.1.1/vagrant_2.1.1_x86_64.deb

# dpkg -i vagrant_2.1.1_x86_64.deb
```

# libvirtd Integration

https://github.com/vagrant-libvirt/vagrant-libvirt#provider-options

```
# aptitude install libvirt-bin libvirt-dev
# /etc/init.d/libvirt-bin restart
$ libvirtd --version
# usermod -a -G libvirtd {{username}}
$ vagrant plugin install vagrant-libvirt
```

# Usage

## Status

* vagrant global-status
* `vagrant status` - status of the current vagrant environment
* `vagrant status {{id}}` - status of a vagrant environment

## Boxes

Choose an image:

https://app.vagrantup.com/boxes/search?provider=libvirt

* `vagrant box add generic/ubuntu1604 --provider=libvirt` - download an image
* `vagrant box update`
* `vagrant box outdated` - List boxes that need updating

## Environments

* `vagrant init generic/ubuntu1604` - create a Vagrantfile
* `vagrant up --provider=libvirt` - run box
* `vagrant halt` - stop box

### Vagrantfile - Project configuration

Boxes are checked when they are started.

Disable update checking:

```ruby
config.vm.box_check_update = false
```

* `config.vm.network "forwarded_port", guest: 80, host: 8080`

Local-only access:

config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

Private network, specifying IP:

config.vm.network "private_network", ip: "192.168.33.10"

Public (bridged) network (shows up as device on host):

config.vm.network "public_network"

Provide access to a directory:

config.vm.synced_folder "../data", "/vagrant_data"

# chef-solo

https://www.vagrantup.com/docs/provisioning/chef_solo.html

# testing

create Vagrantfile
vagrant up
vagrant halt
vagrant destroy --force
