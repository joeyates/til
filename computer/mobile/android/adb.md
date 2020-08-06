# adb "Android Debug Bridge"

Commands:

* devices - list connected devices
* push - copy file to device
* pull - copy file from device
* shell - issue shell commands
* logcat - show logs

# shell

* ls

# logcat

On desktop:

```
$ adb logcat > {some file}
```

# Emulator

Start the emulator (from command line) with -writable-system

In Chrome on connected Desktop:
chrome://inspect/

Launch app

Click 'Inspect'


# Flash Stock

```
# fastboot flashing unlock
```

fastboot flash boot <boot image file name>.img
fastboot flash bootloader <bootloader image file name>.img
fastboot reboot-bootloader

fastboot flash radio <radio image file name>.img

If you **do** want to replace a custom (e.g. TWRP) recovery:

fastboot flash recovery <recovery file name>.img

The system:

fastboot flash system <system file name>.img

Vendor:

fastboot flash vendor <vendor file name>.img
