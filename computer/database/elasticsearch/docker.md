Setup

Temporary:
```
sysctl -w vm.max_map_count=262144
```

Permanent:

/etc/sysctl.conf

```
vm.max_map_count=262144
```

```
docker run --publish 9200:9200 elasticsearch:6.6.1
```
