# List Configured Networks

nmcli connection

# List Wireless Access Points

nmcli device wifi list

# Connect to a Wirless Access Point

First get the BSSID from the Acces Point list (above)

nmcli device wifi connect [SSID] password [password]
