# Defaults

* uses system time zone

# Set time

```
date --date=20150909
date -d20150909
```

# Formats

```
date +{format}
```

```
$ date -d 20150909 +%Y%m%d%H%M%S%z
20150909000000+0200
```

* %Y - year
* %m - month
* %d - day
* %H - hour
* %M - minute
* %S - second
* %z - timezone offset
* %Z - timezone name

# Time zones

```
$ date --date='TZ="Europe/London" 20150608' +%Y%m%d%H%M%S%z
20150608010000+0200
```
(Note use of quotes)