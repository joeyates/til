# Check if a device is blocked

rfkill

# Activate

ifconfig wlan0 up

# Wireless interface info

iwlist wlan0 scan

# Reload wpa_supplicant config

wpa_cli -i wlan0 reconfigure
