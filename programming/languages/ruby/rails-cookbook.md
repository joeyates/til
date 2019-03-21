# Use Dockerized Database

```shell
$ sudo docker run postgres:10
```

```shell
$ export DATABASE_CLEANER_ALLOW_REMOTE_DATABASE_URL=true
$ export DATABASE_URL="postgresql://postgres@172.17.0.2/<database name>"
```
