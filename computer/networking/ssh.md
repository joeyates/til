# Parameters

-l - username ("login_name")
-n - Disable stdin, allowing ssh to run in the background
-N - Do not execute an remote command. Useful when doing port forwarding
-o - set an option '-o "OPTION VALUE"'
-t - Allocate a pseudo terminal
-T - Do not allocate a pseudo terminal
-R - Make a reverse tunnel. Forward connections on the remote side to the local side.

# sshd config

Block password auth

ChallengeResponseAuthentication no
PasswordAuthentication no

# `~/.ssh/config`

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

# Cookbook

## Access two github repos with the same private key

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

## Remote commands

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

## Expose a Local Port to Inbound Traffic

i.e. create a reverse tunnel.

* remote_port - the port opened on the remote computer
* local_port - the post that sshd listens to on your computer

```sh
$ ssh -nNT -R remote_port:localhost:local_port remote_host
```

## Tunnel to a Remote Port

```sh
$ ssh -L local_port:remote_port remote_host
```

## Kill a Connection

```sh
~.
```

## Management

Copy to a remote host:
```
ssh-copy-id -i public_key_file user@hostname
```
