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

### Note about Base64

Authentication is Base64 encoded, both in server prompts and
client replies.

Before trying to authenticate, get Base64 versions of username and password:

```
ruby -rbase64 -e "puts Base64.encode64('my_username)"
```

Server prompts:

VXNlcm5hbWU6 - 'Username:'
UGFzc3dvcmQ6 - 'Password:'

For TLS:

openssl s_client -debug -starttls smtp -crlf -connect localhost:25

EHLO email.beniculturali.it

Check the auth types supported.

For `AUTH LOGIN`:

AUTH LOGIN
