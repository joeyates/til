# Debug on a Connected Android Device

* Install adb (Android Debug Bridge)
* Enable Developer Options - 7 taps on build number
* Enable USB Debugging - in Developer Options (Settings > System > Developer Options > USB Debugging)
* Connect device via cable
* Run `adb devices` to check connection (requires authorization)

## Firefox

* Open Firefox on the device
* Open about:debugging in Firefox on desktop
  * The device should be listed
* Click "Connect"
* A view opens with a list of active tabs
