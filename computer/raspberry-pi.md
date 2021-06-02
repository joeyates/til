# Raspbian

Write image to SD card:

```sh
$ sudo dd if={{image pathname}} of=/dev/mmcblk0 bs=4M status=progress conv=fsync && sync
```

# User

* username: pi
* password: raspberry

# General configuration via Raspberry Pi Shell

```sh
raspi-config
```

Creates files:

* firstBoot.sh
* everyBoot.sh

# Configuration Files

The `/boot` partition can have files modified that
are copied into the system image on startup.

## Wireless Networking

Creates /boot/wpa_supplicant.conf

This is copied to `/etc/wpa_supplicant/wpa_supplicant.conf` by
`/etc/systemd/system/multi-user.target.wants/raspberrypi-net-mods.service`

1. Discover your two-letter country code (US/GB/FR/IT/etc)

2. Get basic configuration block:

```sh
wpa_passphrase {{ssid}} {{passphrase}}
```

Insert the SD card in a computer.

Using the output from above, create
/media/$(whoami)/boot/wpa_supplicant.conf:

```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=AAAAAA
network={
        ssid="XXXXX"
        #psk="YYYYY"
        psk=ZZZZZ
}
```

# SSH

Insert the SD card in a computer.

Create a blank file named `ssh` on the boot partition.

E.g.:

```sh
touch /media/$(whoami)/boot/ssh
```

Log in with:

```sh
$ ssh pi@raspberrypi.local
```

Password: raspberry

# Hostname

https://www.raspberrypi.org/forums/viewtopic.php?f=66&t=184248
https://gitlab.com/JimDanner/pi-boot-script

Original /boot/cmdline.txt

```
console=serial0,115200 console=tty1 root=PARTUUID=738a4d67-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait quiet init=/usr/lib/raspi-config/init_resize.sh
```

After first boot:

```
console=serial0,115200 console=tty1 root=PARTUUID=738a4d67-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait
```
