# Cookbook

## Change hostname on the fly

1. Modify /etc/hostname
2. Update:

```
hostname -F /etc/hostname
```

## Make computer available on LAN as _hostname_`.local`

Use zeroconf:

```
apt-get install libnss-mdns
```

# Block certain (ads, spyware, etc) sites

As root add the contents of http://someonewhocares.org/hosts/hosts
to /etc/hosts.
