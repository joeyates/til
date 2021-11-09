# NextCloudPi

https://docs.nextcloudpi.com/en/how-to-install-nextcloudpi/

tar xf ...
export DEVICE=/dev/mmcblk0
sudo dd bs=4M if=NextCloudPi_XX-XX-XX.img of=$DEVICE conv=fsync status=progress

gparted/gnome-disks: resize rootfs partition to fill available space

# wifi

mount rootfs partition

```
echo "country={{MY COUNTRY}}" | sudo tee --append /media/$(whoami)/rootfs/etc/wpa_supplicant/wpa_supplicant.conf
```

```sh
sudo wpa_passphrase {{ssid}} {{passphrase}} | sudo tee --append /media/$(whoami)/rootfs/etc/wpa_supplicant/wpa_supplicant.conf
```

Test:

```
ping nextcloudpi.local
```

# ssh access

mount boot partition

```sh
sudo touch /media/$(whoami)/boot/ssh
```

mount rootfs partition

```sh
export PI_HOME=/media/$(whoami)/rootfs/home/pi
sudo mkdir $PI_HOME/.ssh
sudo chmod 0700 $PI_HOME/.ssh
cat ~/.ssh/id_rsa.pub | sudo tee $PI_HOME/.ssh/authorized_keys
sudo chmod 0600 $PI_HOME/.ssh/authorized_keys
sudo chown -R 1000 $PI_HOME/.ssh
```

Test:

Start the Pi

```
ssh pi@nextcloudpi.local
```

# Change pi user password

```
ssh pi@nextcloudpi.local
passwd
```

Initial password is `raspberry`

# Configuration

https://docs.nextcloudpi.com/en/how-to-configure-nextcloudpi/

First: visit web UI (https is forced, certificate is self-signed)

Copy generated passwords for user 'ncp'
For some reason it presents 2 passwords

Click on Activate
...wait

Go to https://nextcloudpi.local:4443

log in

Click on 'run' to run the setup wizard.

# Site

https://nextcloudpi.local:4443/ - Web panel

https://nextcloudpi.local/ - Next cloud
