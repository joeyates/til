# openssl

# s_client

* -servername {{name}} - set TLS SNI server name indication
* -showcerts - display the whole certificate chain

## Non-TLS Usage

Random Data

```
openssl rand -base64 128
```

Make a encoded key:

```
openssl rand -base64 512 | tr -d '\r\n' > key_name
```

Make a hash password:

```
openssl rand -hex number_of_bytes
```

# Private Keys

Create

```
openssl genrsa -out mykey.key number_of_bits
```

With a password (4-1023 chars):

```
openssl genrsa -des3 -out encrypted.key number_of_bits
```

Get Info
```
openssl pkey -text -in key
```

Remove Password

```
openssl rsa -in encrypted.key -out unencrypted.key
```

Add Password

```
openssl rsa -in unencrypted.key -des3 -out encrypted.key
```

Get modulus

```
openssl rsa -noout -modulus -in key_file | openssl md5
```

# CSR

Info:

```
man req
```

## Create Interactively

```
openssl req -new -key server.key -out server.csr
```

## Directly
```
openssl req -new \
  -subj '/type_code=value0/type1=value1/type2=...' \
  -key server.key \
  -out server.csr
```

## Create from config file

The config:

```
[req]
prompt = no
distinguished_name = dn
req_extensions     = req_ext

[dn]
CN = www.example.com
O = The Organization
OU = The Office or division
L = The city
ST = The US state, UK County, etc
C = The 2-letter country code

[ req_ext ]
subjectAltName = @alt_names

[alt_names]
DNS.1   = xxx.example.it
```

```shell
$ openssl genrsa -out ./certificate.key 4096
$ openssl \
  req \
  -config certificate.csr.conf \
  -new \
  -key ./certificate.key \
  -out ./certificate.csr
```

## Field Types

* Country Name
  * 2 letter code
  * type_code: C

* State or Province Name
  * in Europe, use the city
  * type_code: ST

* Locality Name
  * in Europe, skip
  * type_code: L

* Organization Name
  * Name of the company buying the cert
  * type_code: O

* Organizational Unit Name
  * optional
  * type_code: OU

* Common Name
  * domain.name
  * type_code: CN
  * for wildcard, use `*.domain.tld`

* Email address:
  * optional
  * type_code: emailAddress

## Info

All info:
```
openssl req -text -in csr_file
```

Subject fields only:
```
openssl req -subject -noout -in csr_file
```

Get key modulus
```
openssl req -noout -modulus -in csr_file | openssl md5
```

# Certificate

## pkcs12

Extract certificate

```
openssl pkcs12 -in input.pfx -clcerts -nokeys -out output.cert
```

Extract key:

```
openssl pkcs12 -in input.pfx -nocerts -out output.key
```

## Get info

Formats:
* x509
* pkcs7
* pkcs12

From x509 file:

```
openssl x509 -text -in {certificate}
```

From pkcs12 file:

```
???
```

## Online

### All info

```
echo | openssl s_client -connect {{domain}}:443 -servername {{domain}} 2>/dev/null | openssl x509 -text
```

```
DOMAIN={{domain}}
echo | openssl s_client -connect $DOMAIN:443 -servername $DOMAIN 2>/dev/null | openssl x509 -text
```

### Check Certificate Expiry

```
echo | openssl s_client -connect {{domain}}:443 -servername {{domain}} 2>/dev/null | openssl x509 -noout -dates
```

The output:

```
---
Certificate chain
0 s:[signature]
  i:[issuer]
1 s:[signature - same as issuer immediately above]
  ...
---
Server certificate
[the certificate]
```

Get key modulus

```
openssl x509 -noout -modulus -in certificate | openssl md5
```

# Cookbook

## Install Certificate on nginx

Check site cert modulus matches private key modulus (see above)
Concatenate, in order, the site cert, intermediate certs and the root cert

```
cat site.crt int1.crt root.crt > site.bundle.crt
```

## Create a self-signed key and certificate

Set these:

```
KEY_BITS= # 2048|4096
COUNTRY=
STATE= # Use city in Europe
ORGANISATION=
DOMAIN=
```

```
openssl req -nodes -new -newkey rsa:$KEY_BITS -subj "/C=$COUNTRY/ST=$STATE/O=$ORGANISATION/CN=$DOMAIN" -x509 -keyout server.key -out server.cert
```
