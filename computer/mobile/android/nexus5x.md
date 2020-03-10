# Rooting

Warnings:

* Unlocking the bootloader causes a factory reset

Prerequisites:

* USB cable (connect to computer)
* adb ("Android Debug Bridge")
* fastboot
* add Linux user to `plugdev` group

# Steps

## Set Developer Options

allow OEM unlocking
allow USB debugging

## Enable Developer Options

* Go to Settings|About
* Tap on "Build number" 7 times

## connect USB cable to phone

## check connection

Unlock screen.

```sh
$ adb devices
List of devices attached
00dc2xxxxxxxxxxx        device
```

## Enter booloader (fastboot mode)

Restart phone, pressing power + volume down

or

```sh
adb reboot-bootloader
```

## Check fastboot

Phone boots to a screen with a boot option pointing to power
button and some system info.

The boot options can be cycled through using the volume buttons.
The options are:
Start|Restart bootloader|Recovery mode|Power off

```sh
# fastboot devices
00dc2xxxxxxxxxxx        fastboot
```

System info:

```
FASTBOOT MODE
PRODUCT_NAME - bullhead
VARIANT - ...
HW VERSION -  rev ...
BOOTLOADER VERSION - ...
BASEBAND VERSION - ...
CARRIER INFO - ...
SERIAL NUMBER - 00dc2xxxxxxxxxxx
SIGNING - production
SECURE BOOT - enabled
DEVICE STATE - locked
```

## Unlock bootloader

* NB: This causes a factory rest of the phone.

* Enter fastboot mode
* Unlock

```sh
fastboot oem unlock
```

Nexus 5X:

```sh
# fastboot flashing unlock
```

Select "Yes Unlock bootloader (may void warranty)"

System info change:

```sh
DEVICE STATE - unlocked
```

```
# fastboot reboot
```

(On boot you get the message: "You software cannot be checked, please lock...")

# Install TWRP

* Enter bootloader
* Download and install TWRP

https://twrp.me/lg/lgnexus5x.html
https://dl.twrp.me/bullhead/

```
# fastboot flash recovery twrp-3.0.2-2-bullhead.img
```

Select 'Restart bootloader'
Press power button
(Reboots)
Select 'Recovery mode'
Press power button
TWRP starts
Select "Allow modifications"
Reboot

# Install Stock ROM

* download image

# Install SuperSU on a non-rooted Device

* Download SuperSU
http://www.supersu.com/download
* Copy to root of device's SD card
* Enter bootloader
* Run TWRP
* Flash zip from sd card
* Choose options wipe cache/dalvik

# Root

* Enable Dev Options
* Unlock bootloader
* Install TWRP
* Install SuperSU

# Relock bootloader

* NB: Only do this with a standard ROM (reflash factory images first)

# Hotspot

Add a default route:

```
# ip route add default via 192.168.1.1 dev wlan0
```

# SSH Access

```sh
ssh -p 8022 u0_a105@192.168.1.5
```

# Resources

* [Official Android Updates](https://developers.google.com/android/ota#bullhead)
