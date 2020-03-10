# Debugging

start the emulator (from command line) with -writable-system

In Chrome on connected Desktop:
chrome://inspect/

Launch app

Click 'Inspect'

## Java Code

```java
Log.i("Some tag", "Some text");
```

On desktop:

```
$ adb logcat > {some file}
```

Tail output.

## Permissions

https://cordova.apache.org/docs/en/latest/guide/platforms/android/plugin.html#android-permissions

# Bluetooth

## Debugging

Enable Bluetooth HCI log on the device via Developer Options
Output is  /sdcard/btsnoop_hci.log

$ adb pull /sdcard/btsnoop_hci.log

# USB Tethering

```
settings put global tether_dun_required 0
```
