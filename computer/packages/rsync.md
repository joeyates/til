# parameters

* -a, --archive - archive mode (same as -rlptgoD)
* -r, --recursive
* -l, --links - copy symlinks
* -p, --perms - preserve permissions
* -t, --times - preserve times
* -o, --owner - preserve owner
* -g, --group - preserve group
* -D - (same as --devices --specials)
* `--exclude=pattern` - skip matching files
* -n, --dry-run - don't write anything, just simulate

# Cookbook

Make a local copy of a directory:

```
$ rsync -av remote.host:/path/to/directory/ /path/to/directory/
```

Ignore difference is ownership:

```
-a --no-owner
```

Specify ssh options:

```
... -e "ssh -l username" ...
```

Push:

```
$ rsync -av -e "ssh -l {{username}}" /path/to/directory/ {{host}}:/path/to/directory/
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

Trial run/dry run:

```sh
--dry-run
```

Remove destination files not present in source

```sh
... --delete ...
```

# Download a remote file, allowing resumption

```console
rsync --progress --partial {{user}}@{{domain}}:{{pathname}} .
```
