# Run a zero-installation Postgres via Docker:

```shell
$ sudo docker run postgres:10
```

Make available on host:

```shell
docker run --publish 5432:5432 postgres:10
```

```
psql -h 127.0.0.1 -U postgres
```

Persist the data:

```shell
docker run --mount source=pg10,target=/var/lib/postgres postgres:10
```

```shell
docker run --publish 5432:5432 \
  --volume pg10:/var/lib/postgresql/data \
  postgres:10
```

Faster testing with an in-memory database:

```
docker run --publish 5432:5432 \
  --mount type=tmpfs,destination=/var/lib/postgresql/data \
  postgres:10 \
  -c fsync=off
```

# Restore to database

First, get the container's ID.

docker exec -ti {{ID}} psql -U postgres
