# Media Centre

Pi3: https://libreelec.tv/downloads_new/raspberry-pi-3-3/
Pi4: https://libreelec.tv/raspberry-pi-4/

```sh
$ sudo dd if={{image pathname}} of=/dev/mmcblk0 bs=4M status=progress conv=fsync && sync
sudo dd if=LibreELEC-RPi2.arm-9.2.4.img of=/dev/mmcblk0 bs=4M status=progress conv=fsync && sync
```

# LibreElec

## Audio

Set output to BT

## Login via ssh

Via UI, set root password

ssh root@...
(copy ssh public key to .ssh/authorized_keys)

## Mount flash read-write

https://wiki.libreelec.tv/config.txt

mount -o remount,rw /flash

Then unmount:

mount -o remount,ro /flash

## Edit config.txt

vi /flash/config.txt

## Autoconnect Trusted Bluetooth Audio

Seems to be a RPi3 problem

Install "Bluetooth Audio Device Changer"

Is LibreElec "audio switcher" a different plugin?

# Video

https://www.raspberrypi.org/documentation/configuration/config-txt/video.md

## Start with HDMI

Login via ssh (above)
Mount flash read-write (above)

in /flash/config.txt

hdmi_force_hotplug=1

## Enable 4k at 60fps

hdmi_enable_4kp60=1

# Remote

Setup:

https://kodi.wiki/view/Smartphone/tablet_remotes

Settings → Services → Remote control → Allow programs on other systems to control Kodi → ON

This setting enables the basic ability to remotely control Kodi.

Settings → Services → Webserver → Allow control of Kodi via HTTP → ON

Many smartphone remotes also display additional library data, such as images and summaries. This setting allows that extra data to be transmitted to your remote app.
Take note of the Port number, the Username and the Password (if any). You'll probably need to enter these in your remote app.

Settings → Services → Zeroconf → Announce these services to other systems via Zeroconf → ON

Android:
https://kodi.wiki/view/Android_remotes

### Kore

Available on F-Droid

### Yatse

org.leetzone.android.yatsewidgetfree
