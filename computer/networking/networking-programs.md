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

# SSH

## Key-pair Creation

Generate `~/.ssh/id_rsa` and `id_rsa.pub`:
```
$ ssh-keygen
```
Specify key file:
```
... -f path_name
```
Specify comment (the text at the end of the public key line):
```
... -C comment
```
Type (use dsa if 1024 bits is ok, otherwise use rsa with > 2048):
```
... -t rsa1|dsa|ecdsa|rsa
```
Bits in the key:
```
... -b number
```

Current best options:
```
ssh-keygen -t rsa -b 4096 -C 'COMMENT' -f id_name
```

## Management

Copy to a remote host:
```
ssh-copy-id -i public_key_file user@hostname
```

Remove a `known_hosts` entry:
```
$ ssh-keygen -R HOST_NAME
```

## Queries

Get key signature:

```
$ ssh-keygen -l -f path_name
```

Output is: key length + hash algorithm + fingerprint + comment + (format)

```
8192 SHA256:M9tRdc8xF41hTGAKjpUUPB3S/Bll04nxR5pTxTtjhVA My comment (RSA)
```

...from text:

```
$ echo "{{the public key}} | ssh-keygen -lf -
```

## `.ssh/config`

Structure:

```
global settings
Host pattern
  specific settings
Host ...
Host pattern1[ pattern2...]
  IdentityFile
  HostName
  Port
  User
  UserKnownHostsFile
  StrictHostKeyChecking
  LocalCommand - command to execute locally after connect
```

Wildcard parameters:
* %d - user's home

Don't add new entries to known_hosts:

```
UserKnownHostsFile /dev/null
```

Don't check against known hosts:

```
StrictHostKeyChecking no
```

patterns
name - a hostname
ip_address
partial_ip_address - with * wildcard

## Cookbook

### Access two github repos with the same private key

1. Choose an ALIAS

2. Setup git remote:
```
git remote add origin git@ALIAS:github_user/REPOS_NAME.git
```

in .ssh/config
```
Host alias
  HostName github.com
  User git
  IdentityFile ~/.ssh/private_key
```

### Remote commands

```sh
$ ssh host -- command
```

Run a remote command in a directory

```sh
$ ssh host 'sh -c "cd path && command"'
```

Run multiple commands (via a remote shell):

```sh
$ ssh host "sh -c 'COMMAND && COMMAND ...'"
```

### Expose a Local Port to Inbound Traffic

i.e. create a reverse tunnel.

* remote_port - the port opened on the remote computer
* local_port - the post that sshd listens to on your computer

```sh
$ ssh -nNT -R remote_port:localhost:local_port remote_host
```

### Tunnel to a Remote Port

```sh
$ ssh -L local_port:remote_port remote_host
```

### Kill a Connection

```sh
~.
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
