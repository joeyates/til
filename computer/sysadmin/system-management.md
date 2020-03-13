# Distributions

## Cookbook

# Package management

## Debian Family: apt-get, aptitude

* `aptitude update` - fetch updated versions of package lists
* `aptitude install `*package* - install **or update** a package

```
aptitude install package=version
```

List files contained in a package:

```
dpkg --listfiles {package name}
dpkg -L {package name}
```

Show which package installed a file:

```
dpkg --search {filename pattern}
dpkg -S {filename pattern}
```

# Services

## Activation/deactivation

Deactivate a service on Debian:

```
update-rc.d {{service}} disable
```

# Cron

There are two types of crontabs:
* global - in /etc/crontab and the files it references
* personal - viewable via `crontab -l`

## Environment variables

These variables apply to all cron jobs which **follow** them until a
different value is set.

* `PATH=` - a ':' separated list of paths
* `MAILTO=` - a (possibly empty) comma separated list of recipients

## Personal crontab fields:

* minute
* hour
* day of month
* month
* day of week: 0-7 (Sunday == 0 or 7) | sun, mon, tue, wed, thu, fri, sat
* command

Repetition:
* once every x: `*/x`
* from x to y: `x-y`
* a list: `x,y,z`

```
#    .---------------------------- minute:       0 - 59 | every n minutes: */n | each minute from x to y: x-y
#    |     .---------------------- hour:         0 - 23
#    |     |     .---------------- day of month: 1 - 31
#    |     |     |     .---------- month:        1 - 12 | jan,feb, ...
#    |     |     |     |     .---- day of week:  0 - 7 (Sunday: 0 or 7) | sun, mon, tue, wed, thu, fri, sat
#    |     |     |     |     |                   (once every x: */x, from x to y: x-y, a list: x, y, z)
#    v     v     v     v     v     command to be executed
```

# Logs

## logrotate

* `size {{n}}` - rotate when files are bigger than `n` bytes. `k` and `M` suffixes
  can be used
* `su {user} {group}`
* `dateext` - name old logs using dates

# System time

## ntp
Manually force time correction:

```
service ntp stop
ntpdate -b 0.ubuntu.pool.ntp.org
service ntp start
```
