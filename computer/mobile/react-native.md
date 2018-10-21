# Howto

https://facebook.github.io/react-native/

# Setup

```
$ sudo yarn global add react-native-cli
```

## Install Android studio

Dependendencies:

```
$ sudo apt-get install \
   libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
```

https://developer.android.com/studio/index.html

Run Android Studio
choose custom
and install

* Android SDK
* Android SDK Platform
* Android Virtual Device

Configure VM acceleration:

https://developer.android.com/studio/run/emulator-acceleration.html#vm-linux

Install the Android 6.0 (Marshmallow) SDK

Set up the ANDROID_HOME environment variable

# Projects

```
$ react-native init {ProjectName}
```

Run AVD (Android Virtual Device)

```
$ android avd
```

```
$ react-native run-android
```
