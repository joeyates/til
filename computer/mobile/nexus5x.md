# Rooting

Warnings:
* Unlocking the bootloader causes a factory reset

Prerequisites:
* working USB cable (connect to computer)
* adb ("Android Debug Bridge")/fastboot environment

# Steps

## Set Developer Options

allow OEM unlocking
allow USB debugging

## Enable Developer Options

  * Go to Settings|About
  * Tap on "Buld number" 7 times

## connect USB cable to phone

## check connection

Unlock screen.

```
$ adb devices
List of devices attached
00dc2xxxxxxxxxxx        device
```

## Enter booloader (fastboot mode)

Restart phone, pressing power + volume down

or

```
adb reboot-bootloader
```

## Check fastboot

Phone boots to a screen with a boot option pointing to power
button and some system info.

The boot options can be cycled through using the volume buttons.
The options are:
Start|Restart bootloader|Recovery mode|Power off

```
$ fastboot devices
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
SERUAL NUMBER - 00dc2xxxxxxxxxxx
SIGNING - production
SECURE BOOT - enabled
DEVICE STATE - locked
```

## Unlock bootloader

* NB: This causes a factory rest of the phone.

* Enter fastboot mode
* Unlock

```
fastboot oem unlock
```

Nexus 5X:

```
fastboot flashing unlock
```

Select "Yes Unlock bootloader (may void warranty)"

System info change:
```
DEVICE STATE - unlocked
```

```
fastboot reboot
```

(On boot you get the message: "You software cannot be checked, please lock...")

# Install TWRP

* Enter bootloader
* Download and install TWRP

```
$ fastboot flash recovery twrp-3.0.2-2-bullhead.img
```

Select 'Restart bootloader'
Press power button
(Reboots)
Select 'Recovery mode'
Press power button
TWRP starts
Select "Allow modifications"
Reboot

# Install SuperSU on a non-rooted Device

* Download SuperSU
http://www.supersu.com/download
* Copy to root of device's SD card
* Enteer bootloader
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

ssh -p 8022 u0_a105@192.168.1.5
