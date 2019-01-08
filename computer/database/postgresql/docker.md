# Run a zero-installation Postgres via Docker:

```shell
$ sudo docker run postgres:10
```

Make available on host:

```shell
sudo docker run -p 127.0.0.1:5432:5432 postgres:10
```

Persist the data:

```shell
sudo docker run --mount source=pg10,target=/var/lib/postgres postgres:10
```
