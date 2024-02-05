# General

KVM is a "Linux hypervisor".

It "allows the kernel to function as a hypervisor."

A [hypervisor](https://en.wikipedia.org/wiki/Hypervisor) is a software creates and runs virtual machines

## Is acceleration in use?

???

# Networking

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

```
chmod 0666 /dev/net/tun
```
