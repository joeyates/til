# Create Repo

Create a repo with an initial empty commit to allow
rebasing of avery successive commit.

```sh
git init
git commit --allow-empty -m "Initial commit"
```

# Checkout

Partial checkout

```sh
git clone -n --depth=1 --filter=tree:0 REPO_URL
cd DIRECTORY
git sparse-checkout set --no-clone DESIRED_DIRECTORY
git checkout
```

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

```sh
git checkout {branch} -- {files}
```

## Is one commit an ancestor of another?

```
git merge-base --is-ancestor {old-commit} {new-commit}
```

# Searching

## Find commits matching text

```sh
git log -G{regexp}
```

## grep on contents of a file that is no longer present

```
git grep {text} $(git rev-list --all -- path/to/file) -- path/to/file
```

## Find Commits By File Extension

git log --name-status -- '*.EXT'

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

# Remove a Directory from History

use https://github.com/newren/git-filter-repo

git-filter-repo --path PATH --invert-paths

# Set the Current Branch in a Bare Checkout

```
git symbolic-ref HEAD refs/heads/{{BRANCH}}
```
