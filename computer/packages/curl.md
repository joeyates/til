# Command line options

* -n, --netrc - use values from ~/.netrc for login and password.
* -T, --upload-file - supply the file name of the file to upload

# Basic GET request

Sends response body to standard out

```
curl {url}
```

# POST request with form data

```
curl {URL} --data key=value
```

multiple values:

```
--data "key_1=value1&..."
```

# GET request with query parameters:

```
curl {URL} -G --data {{payload}}
```

# POST multipart/form-data (--form/-F):

```
--form input_name=value
```

Multiple

```
--form input_name=value --form input_name2=value2
```

Send a file as part of a multipart form:
```
--form input_name=@filename
```

# Specify HTTP method

The default method is GET

```
--request=POST|PUT|PATCH|DELETE
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

# Print response headers

```
-i ...
```

Send a `HEAD` request + print response headers:

```
-I ...
```

Ignore SSL certificates

```
-k
```

url encode (if necessary) POST data in a file

```
curl -T "application/x-www-form-urlencoded" -p data_file url
```

Send HTTP AUTH

```
curl -u username:passwd {URL}
```

Call a socket (curl >= 7.40)

```
curl --unix-socket /srv/app/my.sock http:/
```

# Cookbook

## Send a **`GET`** Request and only show response headers

```
curl -IX GET {URL}
```

## Time request phases:

curl-timings.txt:

```
time_namelookup:  %{time_namelookup}\n
time_connect:  %{time_connect}\n
time_appconnect:  %{time_appconnect}\n
time_pretransfer:  %{time_pretransfer}\n
time_redirect:  %{time_redirect}\n
time_starttransfer:  %{time_starttransfer}\n
----------\n
time_total:  %{time_total}\n
```

```
$ curl -w "@curl-timings.txt" -o /dev/null -s {your URL}
```
