# list public keys

```
s gpg --list-public-keys
```

# list secret keys

```
$ gpg --list-secret-keys
```

# revoke a key

```
$ gpg --gen-revoke {{key id}} > key_revocation.asc
$ gpg --import {{key_revocation.asc}}
$ gpg --keyserver pgp.mit.edu --send-keys {{key id}}
```

# delete secret key

```
$ gpg --delete-secret-keys {{key id}}
```

# delete public key

```
$ gpg --delete-key {{key id}}
```

# gpg2

# Create a fully configured key

gpg2 --full-gen-key

...via a config file:

Create an unattended file:

```
Key-Type: default
Key-Length: 4096
Subkey-Type: default
Name-Real: <My Name>
Name-Email: <email@example.com>
Expire-Date: 0
Passphrase: <gpg_passphrase>
%commit
%echo done
```

$ gpg2 --batch --gen-key <unattended file path>
