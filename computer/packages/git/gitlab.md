# GitLab repo grep

/var/opt/gitlab/git-data/repositories
git grep -i -n --before-context 2 --after-context 2 #{query} 

## Find by file name

### In all history

find -type d -name '*.git' -exec bash -c "(cd '{}' && pwd && git log --all --full-history --name-status -- '*{{pattern}}*')" \;

### Show file contents in branch/revision

```
find -type d -name '*.git' -exec bash -c "(cd '{}' && git show {{branch|sha1}}:{{file name}} 2>/dev/null && echo directory: {})" \;
```

### Find matching text in **commit messages**

find -type d -name '*.git' -exec bash -c "(cd '{}' && pwd && git log --all -p --grep='{{pattern}}' 2>/dev/null)" \;

### Find commits with matching change bodies

find -type d -name '*.git' -exec bash -c "(cd '{}' && pwd && git log --all -p -G '{{pattern}}' 2>/dev/null)" \;
