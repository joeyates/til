# Navigate a local site by artificial domain name

Motivation:
* your site needs to set domain cookies (e.g. *.example.com),
* you want to hand-test the site by running it on a local machine,
* other devices need to access the site.

## Edit the smartphone's /etc/hosts

* possible if you have a rooted device
* Android?
* iOS?

## Use the dev machine as a DNS Server

* Update your access points' DNS settings to point to the dev machine
* Run dnsmasq on the dev machine

Pros:

Cons:
* Possible in situations where the developer is one of few local network users

```
apt-get install dnsmasq
```

edit /etc/resolv.conf

```
nameserver 127.0.0.1
nameserver [REAL NAMESERVER]
```

edit /etc/hosts

```
[LOCAL IP]  [SPOOFED ADDRESS]
```

##  Use Ettercap DHCP Stealing

* set up DNS in /usr/share/ettercap/etter.dns:

```
myapp.example.com  A [LOCAL IP]
```

* get iPhone Mac address: Settings, General > About

Not working - doesn't capture traffic
```
ettercap --curses --mitm dhcp:192.168.1.200-250/255.255.255.0/192.168.1.1 18:E7:F4:E9:40:22/// /192.168.1.1//
```

## Use Ettercap ARP poisoning

