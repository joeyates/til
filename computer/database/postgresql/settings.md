# PostgSQL Settings

# Querying

All settings:

```sql
SHOW ALL;
```

Specific:

```sql
SHOW {setting};
```

As query:

```sql
SELECT * FROM pg_settings;
```

# postgresql.conf

Settings in `/etc/postgresql/{version}/main/postgresql.conf`

* `listen_address` - network addresses to listen to.

Default: localhost

For varied addresses, use `"*"` and limit access via `pg_hba.conf`

* `max_connections`

Default: (9.4) 100

Some other resources are beased on a per-client basis, so this settings
affects the total amount of resources used by other settings.

Streaming replication: this must match between master and slave.

* `shared_buffers` - maximum working memory.

Default: 24MB

For <9.3, Linux's shared memory limit need to be adjusted when large
values of `shared_buffers` were set.

* `effective_cache_size` - on disk space available

Default: 128MB

* `work_mem` - per-connection workspace

Default: 1MB

* `log_min_duration_statement` - threshold over which slow queries are logged

Default: -1

* `random_page_cost` - the estimated cost of index scans compared to
  sequential scans (`seq_page_cost`). Lower this for SSD drives.

Default: 4

## Example

A server with 32GB RAM, sharing with a fairly busy application.

```conf
# memory use

shared_buffers         8GB    # 32GB RAM / 4
max_connections        200    # Must be equal to any replication slaves
effective_cache_size   24GB   # 32GB RAM * (3/4)
work_mem               40MB   # 32GB RAM / max_connections
maintenance_work_mem   4GB    # 32GB RAM / 8

# query planning

cpu_tuple_cost         0.0030
cpu_index_tuple_cost   0.0010
cpu_operator_cost      0.0005

default_statistics_target    100
checkpoint_completion_target 0.7
```
 
# logging

## Example

```conf
log_directory"                => "/var/log/postgresql",
log_filename"                 => "postgresql-%Y-%m-%d_%H%M%S.log",
log_statement"                => "all",  # log *all statements
log_line_prefix"              => "%t ",
logging_collector"            => "on",
```

# Settinns/tuning articles:

* [Tuning PostgreSQL on your Dedicated Server](http://www.anchor.com.au/hosting/dedicated/Tuning_PostgreSQL_on_your_Dedicated_Server)
* [online calculator](http://pgtune.leopard.in.ua/)

