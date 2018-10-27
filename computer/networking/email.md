# Sendmail

Use only ipv4:
```
CLIENT_OPTIONS(`Family=inet')
```

# Anti Spam

## SPF

http://www.openspf.org/

DNS record:

```
                         type  value
    domain.  ttl_seconds SPF   "v=spf1 ip4:ipv4 ip6:ipv6 -all"
```

Indicate an IPv4 is good, without blocking other IPs:
```
    "v=spf1 ip4:ipv4"
```

# Cookbook

## Send email from the command line

With sendmail:

```
echo {body} | sendmail {address}
```

With mail:
```
echo "body" | mail -s "subject" address
```

## Debug SMTP

For non-TLS connections:

```shell
$ telnet <mail server> <port>
```

For TLS:

```shell
$ openssl s_client -debug -starttls smtp -crlf -connect <mail server>:<port>
```

### Note about Base64

Authentication is Base64 encoded, both in server prompts and
client replies.

Before trying to authenticate, get Base64 versions of username and password:

```
ruby -rbase64 -e "puts Base64.encode64('my_username')"
ruby -rbase64 -e "puts Base64.encode64('my_password)"
```

Server prompts:

VXNlcm5hbWU6 - 'Username:'
UGFzc3dvcmQ6 - 'Password:'

### Interacting with the SMTP Server

* `HELO <hostname>` - initiate conversation. It seems that <hostname> can be
  any FQDN.
* `EHLO <mail server>` - extended Hello. Server sends a list of its
  capabilities.
* `STARTTLS`
* `AUTH LOGIN` - initiate 'login' authentication (or check if it's supported)
* `MAIL FROM:<email address>` - start composing a new email and set
  sender's address
* `RCPT TO:<email address>` - set recipient's address
* `DATA` - start sending email body. The server accepts input up to the
  first `<crlf>.<crlf>` sequence. The email is sent when data entry
  concludes.
* `QUIT`
