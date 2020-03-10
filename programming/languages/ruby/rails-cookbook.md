# Use Dockerized Database

```shell
docker \
  run \
  --publish 5432:5432 \
  --rm \
  --volume pg12:/var/lib/postgresql/data \
  -e POSTGRES_HOST_AUTH_METHOD=trust \
  postgres:12
```

```shell
$ export DATABASE_CLEANER_ALLOW_REMOTE_DATABASE_URL=true
$ export DATABASE_URL="postgresql://postgres@127.0.0.1/<database name>"
```
