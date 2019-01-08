# Rasbian

Write image to SD card:

```
$ sudo dd if=2018-10-09-raspbian-stretch.img of=/dev/mmcblk0 bs=1M status=progress && sync
```

## User

* username: pi
* password: raspberry

## SSH

Create a file named `ssh` on the boot partition.

```
$ ssh pi@raspberrypi.local
```

## Modify Image

## Set up networking

```
$ wpa_passphrase <ssid> <passphrase> /etc/wpa_supplicant.d/wpa_supplicant.conf
```

/etc/network/interfaces:

```
auto wlan0
iface wlan0 inet static
  wpa-conf /etc/wpa_supplicant.d/wpa_supplicant.conf
  address <statically assign an IP on the wireless network>
  netmask 255.255.255.0
  gateway <the wireless network router IP>
```
