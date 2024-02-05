# Info about Hardware

## CPU

```
cat /proc/cpuinfo
```

## Various

BIOS, System, Base board, Chassis, Processor, Cache, Ports,
System slot (?), Memory, Pointing devices, Battery, Security hardware,
Voltage monitor, Cooling, Temperature, Power supply
```
dmidecode
```

## BIOS

```
dmidecode -s bios-version
```

## Battery

```
/sys/class/power_supply/BAT1/charge_now
```

# Packages

* linux-tools-generic (for Ubuntu, install the package which matches current kernel)
  * turbostat

# Resource Usage

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

Check power usage of PCI connections in freeze state for 60s

```
turbostat --show Pkg%pc2,Pkg%pc3,Pkg%pc6,Pkg%pc7,Pkg%pc8,Pkg%pc9,Pk%pc10,SYS%LPI rtcwake -m freeze -s 60
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
