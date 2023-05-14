# Project

https://github.com/pi-hole/pi-hole.git

# Prerequisites

Install Raspbian
https://www.raspberrypi.org/software/

# Install

* Ensure the Raspberry Pi has a fixed IP address on the local network.

* Gain root access

Activate sshd

```sh
sudo touch /media/$(whoami)/bootfs/ssh
```

Encrypt password

```
echo 'mypassword' | openssl passwd -6 -stdin
```

```
echo 'myuser:encryptedpassword' > /media/$(whoami)/bootfs/userconf
```

Boot

Log in

```sh
ssh myuser@raspberrypi.local
```

Copy ssh key to user

https://docs.pi-hole.net/main/basic-install/

```sh
curl -sSL https://install.pi-hole.net | bash
```

# Change Web Interface Password

```
pihole -a -p
```

# Update

```
pihole updatePihole
```

# Admin Web UI

https://github.com/pi-hole/AdminLTE.git

# TODO

* Use unbound
https://docs.pi-hole.net/guides/dns/unbound/
