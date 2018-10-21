# package.json

## Cookbook

### Use a local dependency

```
  "scripts": {
    "preinstall": "npm install /path/to/package/",
  },
  "dependencies": {
    "package": "*",
  },
```

### Use a package on GitHub

```
  "dependencies": {
    "package": "github-user/package"
  }
```

Specify branch:
```
  "dependencies": {
    "package": "github-user/package#branch"
  }
```
