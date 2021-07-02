# public keys

list:

```sh
$ gpg2 --list-public-keys
```

add:

```sh
$ gpg2 --import {{key}}
```

delete:

```sh
$ gpg2 --delete-key {{key id}}
```

# secret keys

list:

```sh
$ gpg2 --list-secret-keys
```

revoke:

```sh
$ gpg2 --gen-revoke {{key id}} > key_revocation.asc
$ gpg2 --import {{key_revocation.asc}}
$ gpg2 --keyserver pgp.mit.edu --send-keys {{key id}}
```

delete:

```sh
$ gpg2 --delete-secret-keys {{key id}}
```

# encrypt

```sh
$ gpg2 --output {{output file}} --encrypt --recipient {{key id}} {{file}}

# Cookbook

## Create a fully configured key

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
