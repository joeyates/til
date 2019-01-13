http://www.openspf.org/

DNS record:

```
                         type  value
    domain.  ttl_seconds SPF   "v=spf1 ip4:ipv4 ip6:ipv6 -all"
```

Indicate an IPv4 is good, without blocking other IPs:

```
    "v=spf1 ip4:ipv4"
```
