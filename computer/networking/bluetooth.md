# Troubleshooting

bluetoothd -n -d

hciconfig -a

service bluetooth status

# bluetoothctl

Start:

```
$ bluetoothctl
[bluetooth]#
```

Find the MAC address of the device you and to pair with:

```
power on
agent on
scan on
...
scan off
```

List paired devices:

```
paired-devices
```

Quit:

```
quit
```
