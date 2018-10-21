# Quick check

* `df -h` - is there disk space?
* `top`
  * load average (1', 5' 15') - should be less than number of processors
  * Mem/Swap - Mem free > 0? Swap used > 0?
* `vmstat 1` - (swap and IO: si, so, bi, bo) what is changing?

# Memory

* What's using memory?
```
ps -eo pmem,cmd -ww | sort
```

# Disk usage by directory

```
du -d1 -BM | sort -rn
du --max-depth=1 --block-size=M | sort --reverse --numeric-sort
```

# If package installation is possible

* `iostat 1` - disk IO
* `mpstat` - processor-related statistics (Debian package: sysstat)
* `hping3` - a better ping (Debian package: hping3)
* `htop` - a better top (Debian package: sysstat)
* `dstat` - a better vmstat (Debian package: sysstat)
* `nictstat 1` - network traffic monitor (Debian package: nicstat)

# Intermediate

* `sar` (package: sysstat)
* `atsar` (package: atsar)
* `netstat` (package: net-tools)
* `pidtstat` (package: sysstat)
* `strace` - can slow processes
* `tcpdump`
* `blktrace`
* `iotop`
* `iostat` (package: sysstat)
* `slabtop`
* `sysctl` - how is system configured?
* `/proc`

# Advanced

* `perf` (package: linux-tools) - performance monitors
* `dtrace` - lower overhead than strace
* `systemtap` - panics/freezes
