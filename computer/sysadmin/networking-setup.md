# Local Network Configuration

File: `/etc/network/interfaces`

## Cookbook

### Configure a static IP

Add a virtual device with an IP Live:

```
ifconfig device:virtual_index ip netmask 255.255.255.0
Permanent, edit /etc/network/interfaces:
auto device:virtual_index
iface device:virtual_index inet static
address ip
netmask 255.255.255.0
gateway gateway
```

# Services - SysV

Stop:

````
/etc/init.d/{service} stop
```

Start:

```
/etc/init.d/networking start
```

```
service networking start
```

# DHCP

```
auto interface
iface interface inet dhcp
```

# Applications

## ip
https://dougvitale.wordpress.com/2011/12/21/deprecated-linux-networking-commands-and-their-replacements/

### glossary
* link - device/interface


Add IP address to device:
    ip addr add 10.254.5.174/16 dev eth0
Remove IP from device:
    ip addr del 10.254.5.174/16 dev eth0
List links
    $ ip l[ink]
List links and addresses:
$ ip a[ddr]
List routes
    $ ip r[oute]
...default routes (e.g. gateways) are listed first.
List addresses:
    $ ip a

# Firewall
iptables
http://articles.slicehost.com/2011/2/21/introducing-iptables-part-1
Data:
Debian/Ubuntu: /etc/iptables.rules
Tables
Default: filter
filter chains: INPUT, OUTPUT, FORWARD
List rules:
iptables -L
List rules without resolving names:
iptables -L -n
Save rules:
/sbin/iptables-save > RULES FILE
Restore rules:

/sbin/iptables-restore < RULES FILE
Add a rule at end of chain:
iptables -A chain rule
# DNS
named
Config:
    /etc/named.conf

## dig
Get name service info (in verbose form):
$ dig domain
usage:
$ dig options [@server] domain [type]
options:
+[no]cmd - print/don't print version and global options
types:
Root nameservers:
+nssearch
Just get the IP:
+short
Reverse (from IP to hostname):
-x IP
Trace resolution (skips intermediate DNS caches):
    +trace

# Block domains
Edit /etc/resolvconf/resolv.conf.d/tail
    127.0.0.1 domain
Content appended to /etc/resolv.conf after reboot

# Spoofing
* ettercap
