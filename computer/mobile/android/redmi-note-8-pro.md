https://forum.xda-developers.com/redmi-note-8-pro
https://forum.xda-developers.com/redmi-note-8-pro/how-to/redmi-note-8-pro-guide-firmwares-twrp-t3987121
https://www.xda-developers.com/redmi-note-8-pro-custom-development-lineageos-17-1-google-camera-port-pixel-experience/
https://forum.xda-developers.com/redmi-note-8-pro/development/recovery-twrp-3-3-1-0-touch-recovery-t4039691
https://forum.xda-developers.com/redmi-note-8-pro/how-to/guide-redmi-note-8-pro-megathread-t4056527
https://twrp.me/xiaomi/xiaomiredminote8pro.html

# ROMs

## Stock

https://c.mi.com/miuidownload/index

Unofficial:

https://www.xda-developers.com/download-miui-11-xiaomi-redmi-note-7-pro-poco-f1/
https://xiaomifirmwareupdater.com/miui/begonia/

## POSP

https://forum.xda-developers.com/redmi-note-8-pro/development/rom-posp-v3-1-3-8-begonia-begoniain-t4059539

# Info

product: begonia
meaning - this is 'China / Global'

# USB Debugging

(These need a SIM card to be installed)
Enable "USB debugging" on device
Enable "Install via USB" on device - requires sign-in

# Xiaomi Unlock

https://www.xda-developers.com/xiaomi-anti-rollback-protection-brick-phone/

Xiaomi phones require a wait of 15 days to be unlocked (!)
Create an account, associate phone, try to unblock via settings
Initially, unlock fails
Wait for 15 days...

Use https://www.xiaomitool.com/V2/

# XMT2 HOW TO

chmod +x XMT2_Linux_9.11.10.run
./XMT2_Linux_9.11.10.run

# Unlock Bootloader

N.B.: This procedure re-initialises the phone.
Connect device via USB
Run XMT2
Choose unlock
UI asks for i.miui.com login

# Disable AVB

From official ROM

fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img

# Recovery

## Install TWRP

https://eu.dl.twrp.me/begonia

sha256:
a8e0994db5acab379ebcb9fac84e3bf16ad06324cd988d0ec34cb90c6d6de288  twrp-3.3.1-0-begonia.img

adb reboot bootloader
fastboot flash recovery twrp-3.3.1-9-begonia.img
fastboot reboot
Reboot holding Volume Up
TWRP appears after a while

In LWRP: confirm allowing modifications

## Orangefox

https://sourceforge.net/projects/begonia-development/files/orangefox/

Result: unable to reboot into recovery

# Reboot to Recovery

adb reboot recovery

# Install Custom ROM

## Ensure Antirollback will not be Triggered

$ fastboot getvar anti
anti: 1

Official MIUI ROMs have the anti version in
images/anti_version.txt

## Install ROM

Copy zip to a directory in internal storage (e.g. Downloads)

adb reboot recovery

Choose Install

## Lineage OS

* Kept crashing
* Apps are awful

## Pixel Experience

http://c.mi.com/oc/thread-3023083-1-0.html

# Attempt 1

In TWRP

1. Wipe

* Dalvik / ART Cache
* Cache
* System
* Data

2. Install ROM

Pixel Experience Plus
(PixelExperience_Plus_begonia-10.0-20200606-1259-OFFICIAL.zip)

fail: after first reboot, restarts the phone after about 20s

Pixel Experience
(PixelExperience_begonia-10.0-20200606-1238-OFFICIAL.zip)

fail: after first reboot, restarts the phone after about 20s

(PixelExperience_begonia-10.0-20200512-1110-OFFICIAL.zip)

fail: after first reboot, restarts the phone after about 20s

# Attempt 2

Wipe:

* Dalvik / ART Cache
* Cache
* System
* Data
* Vendor

Repair: Data + Vendor

Install

Wipe cache

Reboot

-> Boots into Fastboot
