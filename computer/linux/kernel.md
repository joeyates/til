See resource usage:

```sh
watch cat /proc/stat
```

# Memory usage

```sh
cat /proc/meminfo
```

Derived commands:

```sh
free
```

Other

* top
* htop
* powertop
* glances

# sysctl

Parameters are file paths below /proc/sys with '/' replaced with '.'

## List parameters

sysctl -a

## Making changes

Temporary changes

```
sysctl -w vm.dirty_writeback_centisecs=1500
```

Permanent changes:

Edit /etc/sysctl.conf or add a file to /etc/sysctl.d
