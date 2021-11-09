# Key-pair Creation

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

# Remove a `known_hosts` entry:

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
