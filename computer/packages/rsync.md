# parameters

* `--exclude=pattern` - skip matching files

# Cookbook

Make a local copy of a directory:

```
$ rsync -av remote.host:/path/to/directory/ /path/to/directory/
```

Specify a remote user for SSH:

```
... -e "ssh -l username" ...
```

Push:
$ rsync -av -e "ssh -l {{username}} /path/to/directory/ {{host}}:/path/to/directory/


Use SSH private key:

```
... -e "ssh -i expanded_path_to_key" ...
```

Resume incomplete uploads

```
... --partial ...
```

Show progress bar

```
... --progress ...
```

Resume and show progress

```sh
... -P ...
```

Trial run/dry run:

```sh
--dry-run
```

Remove destination files not present in source

```sh
... --delete ...
```

# Download a remote file, allowing resumation

rsync --progress --partial root@{{domain}}:{{pathname}} .
