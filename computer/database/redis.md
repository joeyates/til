# Types

https://redis.io/topics/data-types

## list

Commands:

* llen {key}} - length of list
* lpush - add to start
* rpush {{key}} {{items}} - add to end
* lrange {{key}} {{start}} {{end or negative offset from end}}

## zset - sorted set

Commands:
https://redis.io/commands#sorted_set

* ZCARD {{key}} - member count
* ZRANGE {{key}} {{min offset}} {{max offset}} - return members

# Introspection

## Listing Keys with SCAN

SCAN is started with 0 as the cursor, and returns a new cursor each time
until it completes, returning 0.

> SCAN 0
1) {{new cursor}}
2) {{about 10 values}}

> SCAN 0 COUNT {{approx count of values to return}}

## Listing Keys with KEYS

KEYS {{pattern}}

## Checking a key exists

EXISTS {{key}}

## Key Info with TYPE

TYPE {{key}}

# redis-cli

Connect:

redis-cli -h {{host}} -p {{port}} --user {{username}} --pass {{password}}
redis-cli -u {{uri}}

Quit:
Ctrl+C
