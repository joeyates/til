# Status

* `git clean -dx` - remove all non-repo files, except other repos
* `git clean -nffdx` - what files would be removed by a full clean?
* `git clean -ffdx` - do a full clean

# Viewing

## Show file contents from a certain revision

```
git show {commit}:{path}
```

## List files in another branch

```shell
git ls-tree -r --name-only {branch}
```

# Copying

## Update file contents from a certain revision

```
git checkout {commit}:{path}
```

## Copy file from another branch

```shell
git checkout {branch} -- {files}
```

## Is one commit an ancestor of another?

```
git merge-base --is-ancestor {old-commit} {new-commit}
```

# Searching

## Find commits matching text

```shell
git log -G{regexp}
```

## grep on files involved in past commits

```
git grep {text} $(git rev-list --all -- path/to/file) -- path/to/file
```

### git grep - print lines matching a pattern

--cached - search in index file
-i, --ignore-case

### git log - show commit logs

--all - search in all refs
--remotes - search in all remote refs
--grep={{pattern}}
--perl-regexp - alloe PCRE-style regexps
-p, -u, --patch - Show the diff

# Split commits

Start a rebase from the commit

```
git rebase -i {commit}~1
```

Mark commit(s) to be split with "edit" and save.

Unstage the commit:

```
git reset HEAD~1
```

Create smaller commits.

```
git rebase --continue
```

# Fixup

```
$ git commit --fixup={{SHA1}}
$ git rebase -i --autosquash
```
