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

Remove destination files not present in source

```sh
... --delete ...
```

# Download a remote file, allowing resumation

rsync --progress --partial root@{{domain}}:{{pathname}} .
