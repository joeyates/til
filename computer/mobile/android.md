# Apps

## F-Droid

* Download from https://f-droid.org/
* Copy apk to Internal storage
* Open Files

# Bluetooth

## Debugging

Enable Bluetooth HCI log on the device via Developer Options
Output is  /sdcard/btsnoop_hci.log

$ adb pull /sdcard/btsnoop_hci.log

# USB Tethering

```
adb shell
settings put global tether_dun_required 0
```

Without root, results in error:
Security exception: Permission denial: writing to settings requires:android.permission.WRITE_SECURE_SETTINGS
