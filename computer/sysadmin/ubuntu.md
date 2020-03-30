# Distribution Upgrade

```
do-release-upgrade
```

To upgrade from old, unsupported distributions, use 'old-releases.ubuntu.com'

# 18.04 -> 2.04

https://www.cyberciti.biz/faq/upgrade-ubuntu-18-04-to-20-04-lts-using-command-line/

sudo apt update
sudo apt list --upgradable
sudo apt upgrade

reboot

apt --purge autoremove

```sh
do-release-upgrade
```

This disables entries under `/eta/apt/sources.list.d`

or, for pre-release:

do-release-upgrade -d
