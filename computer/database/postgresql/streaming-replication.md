# PostgreSQL Streaming Replication

What follows is a procedure for setting up PostgreSQL streaming replication.

# Master and slave

Actions are to be performed on the master or the slave:

* M = master
* S = slave

* master and slave must have the same version of PostgreSQL,
* perform all actions as user 'postgres'.

# Configure master

M, create the replication user:

```
CREATE USER [REPLICATION_USER] REPLICATION
  LOGIN CONNECTION LIMIT 1
  PASSWORD '[REPLICATION_PASSWORD]';
```

M, edit pg\_hba.conf:

```
host replication [REPLICATION_USER] [SLAVE_IP]/32 md5
```

M, edit postgresql.conf:

Ensure `listen_addresses` is either `"*"` or specifically  includes the
IP address of the slave.

```
listen_addresses  = "*"
```

`wal_keep_segments = `[at least 32, but better much higher]

`max_wal_senders = `[one for each slave]

M, restart postgresql

# Configure slave

S, prepare environment:

```
export REPLICATION_USER=[REPLICATION_USER]
export REPLICATION_PASSWORD=[REPLICATION_PASSWORD]
export PG_VERSION=[PG_VERSION]
export SLAVE_CLUSTER_NAME=[SLAVE_CLUSTER_NAME]
export SLAVE_CLUSTER_PORT=[SLAVE_CLUSTER_PORT]
export SLAVE_DATA_DIRECTORY=/var/lib/postgresql/$PG_VERSION/$SLAVE_CLUSTER_NAME
export MASTER_IP=[MASTER_IP]
export MASTER_CLUSTER_PORT=[MASTER_CLUSTER_PORT]
```

## Become a hot standby slave

S, edit postgresql.conf:

```
wal_level = hot_standby
hot_standby = on
```

In order to have the master ready to be switched to being a slave, it is useful
to add this setting to the master's postgresql.conf too.

# Prepare slave for copy

## Create new cluster

S:

```
pg_createcluster --port $SLAVE_CLUSTER_PORT $PG_VERSION $SLAVE_CLUSTER_NAME
```

This cluster will be created, but will not be started.

S, prepare data directory:

```
rm -rf $SLAVE_DATA_DIRECTORY/*
```

# Copy files

S, Using `pg_basebackup`:

This asks for the replication user's password (unless set in .pgpass).

```
PGCLUSTER=$PG_VERSION/$SLAVE_CLUSTER_NAME pg_basebackup \
  --pgdata=$SLAVE_DATA_DIRECTORY \
  --xlog-method=fetch \
  --username=$REPLICATION_USER \
  --host=$MASTER_IP
```

## `--write-recovery-conf`

For postgresql >= 9.3 there is the `--write-recovery-conf` option, which creates
`$SLAVE_DATA_DIRECTORY/recovery.conf`
Unfortunately, the file does not have the `trigger_file` setting. So it is
effectively useless.

```
pg_basebackup \
  --write-recovery-conf \
  --pgdata=$SLAVE_DATA_DIRECTORY \
  --xlog-method=fetch \
  --username=$REPLICATION_USER \
  --host=$MASTER_IP
```

See below for the manual method, which is an alternative to `pg_basebackup`.

# Complete

S, add missing files and directories:

```
ln -s /etc/ssl/certs/ssl-cert-snakeoil.pem $SLAVE_DATA_DIRECTORY/server.crt
ln -s /etc/ssl/private/ssl-cert-snakeoil.key $SLAVE_DATA_DIRECTORY/server.key
```

S, create `$SLAVE_DATA_DIRECTORY/recovery.conf`:

This file will be copied to the database's data directory after all the data has been copied.

```
echo "\
standby_mode = 'on'
primary_conninfo = 'host=$MASTER_IP port=$MASTER_CLUSTER_PORT user=$REPLICATION_USER password=$REPLICATION_PASSWORD'
trigger_file = '/tmp/postgresql.trigger.$SLAVE_CLUSTER_PORT'\
" > $SLAVE_DATA_DIRECTORY/recovery.conf
```

S, start cluster:

```
pg_ctlcluster $PG_VERSION $SLAVE_CLUSTER_NAME start
```

## M, Manual method

```
export PG_VERSION=[PG_VERSION]
export SLAVE_IP=[SLAVE IP]
export SLAVE_CLUSTER_NAME=[SLAVE_CLUSTER_NAME]
export SLAVE_DATA_DIRECTORY=/var/lib/postgresql/$PG_VERSION/$SLAVE_CLUSTER_NAME
export MASTER_CLUSTER_NAME=[MASTER_CLUSTER_NAME]
export MASTER_DATA_DIRECTORY=/var/lib/postgresql/$PG_VERSION/$MASTER_CLUSTER_NAME
psql -c "select pg_start_backup('initial_backup');"
rsync -cva --inplace \
    --exclude='pg_xlog*' \
    --exclude='server.*' \
    --exclude='postmaster.*' \
    $MASTER_DATA_DIRECTORY/ \
    $SLAVE_IP:$SLAVE_DATA_DIRECTORY/
psql -c "select pg_stop_backup();"
```

# Troubleshooting

## Slave won't allow connections

```
$ psql
psql: FATAL:  the database system is starting up
```

Solution:

Add

```
wal_level = hot_standby
hot_standby = on
```

to slave's postgresql.conf.

Add

```
local all all  md5
host all all 127.0.0.1/32 md5
host all all ::1/128 md5
```

to slave cluster's pg_hba.conf
