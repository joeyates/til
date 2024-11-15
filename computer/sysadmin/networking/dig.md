Get name service info (in verbose form):

```sh
$ dig domain
```

usage:

```sh
$ dig options [@server] domain [type]
```

options:

* +[no]cmd - print/don't print version and global options
* +nssearch - root nameservers
* +short - just get the IP
* -x IP -reverse (from IP to hostname)
* +trace - trace resolution (skips intermediate DNS caches)

