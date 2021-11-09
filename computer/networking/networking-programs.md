# dig

```
dig [@server] name [type]
```

* type: `ANY`|`A*`|`MX`|`SIG`|`NS`|...

## Query options

Set:
```
+OPTION
```
Unset:
```
+noOPTION
```

* all
* authority (default: on)
* trace (default: off) - start with root nameservers and recursively query for the domain

## Cookbook

### Get Domain's nameservers

```
dig DOMAIN NS
```

## Management

Copy to a remote host:
```
ssh-copy-id -i public_key_file user@hostname
```

# Email

See file

# HTTP

## Status Codes
w3.org
wikipedia
2xx
3xx
301 Moved Permanently
302 Found

## Apache
NameVirtualHost
only use *:port if specific VirtualHosts will be responding on all IPs.
From the docs: "Note that the argument to the <VirtualHost> directive must exactly match the argument to the NameVirtualHost directive."

### Cookbook
Name-based VirtualHosts
```
NameVirtualHost IP:port
<VirtualHost IP_OR_ASTERISK:port>
  ServerName name.tld
</VirtualHost>
```

## curl
scripting docs
Send response body to standard out:

    curl url

specify HTTP method (default: GET):

```
-X POST or --request=POST|PUT|PATCH|DELETE
```

With user and password:

```
--user user:password
```

Save cookies to file (--cookie is necessary):

```
    --cookie cookies.txt --cookie-jar cookies.txt ...
```

Read cookies from file:

```
    --cookie cookies.txt
```

POST form data (--data/-d):

```
    --data "key_1=value1&..."
```

POST multipart/form-data (--form/-F):

```
    --form input_name=value
```

Send a file multipart/form-data:

```
    --form input_name=@filename
```

Print response headers:

```
    -i ...
```

Head request + print response headers:

```
    -I ...
```

Ignore SSL certificates

```
    -k
```
Download directories via SFTP:
ab - Apache Bench
POST
url encode (if necessary) POST data in a file
```
    curl -T "application/x-www-form-urlencoded" -p data_file url
```

# General Cookbook

## Which process is using a certain port?:
```
lsof -Pnl +M -i4 | grep <PORT NUMBER>
```

## Decrypt my TLS Traffic

* https://jimshaver.net/2015/02/11/decrypting-tls-browser-traffic-with-wireshark-the-easy-way/
