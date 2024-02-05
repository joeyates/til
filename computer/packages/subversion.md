# Convert Subversion Dump to Git Repo

```
svnadmin create {{repository name}}
svnadmin load {{repository name}} < dump.svn
git svn clone --stdlayout --no-metadata file:///full/path/to/repository {{git repository path}}
# without --stdlayout if you do not have a standard layout!
git svn clone --no-metadata file:///full/path/to/repository {{git repository path}}
```

# List Files

```
svnlook tree .
```
