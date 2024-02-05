# Cookbook

# Excessive Power Usage During Standby

```
$ cat /sys/power/mem_sleep
```

```
[s2idle] deep
```

Deep sleep is available but not enabled

```
s2idle [deep]
```

Deep sleep is available and enabled

## Enable deep sleep

* Edit /etc/default/grub

```diff
- GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
+ GRUB_CMDLINE_LINUX_DEFAULT="quiet splash mem_sleep_default=deep"
```

```
update-grub
```
