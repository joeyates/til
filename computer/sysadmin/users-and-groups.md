# Users

Create a user *without* a home directory:

```
# useradd {{username}}
```

Create a user with a home directory:

```
# useradd --create-home {{username}}
```

...specifying shell:

```
# useradd --create-home --shell=/path/to/shell username
```

...with additional groups:

```
# useradd --groups other,groups ...
```

## Query

List users' shells (Mac OS X):

```
# dscl . -list /Users UserShell
```

## Delete

Delete a user:

```
# userdel username
```

## Modify

### Groups

Add a group to an existing user:

```
# usermod -aG group user
```

Remove a group from a user:
```
# gpasswd -d user group
```
### Home Directory
Change home directory:
```
# usermod -d /home/user user
```
### Password
Set:
# passwd username
Enable an account which is locked:
```
# passwd username
```
...set a temp password.
```
# passwd -d username
```

## Encrypted Passwords
Encrypt a password:
```
echo 'MY_PASSWORD' | mkpasswd -m sha-512 -s
```
Set a user's password from the encrypted version:
```
usermod -p 'ENCRYPTED_PASSWORD' user
```

## Shell
Change user's default shell
Linux:
```
# usermod -s /path/to/shell user
```
Mac OS X:
```
# dscl . -create /Users/user UserShell /path/to/shell
```

## Sudo Access - /etc/sudoers

Commands can include wildcards:
```
foobar *
```
Allow a user to run a specific command without a password:
```
username ALL=(ALL) NOPASSWD: command
```

# Groups

```
groupadd groupname
```

OSX:
```
sudo dscl . -create /groups/name
```
