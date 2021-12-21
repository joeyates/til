# Global Packages

## Install

```sh
npm install -g PACKAGE
```

```sh
npm uninstall -g PACKAGE
```

## List

Indicate installation path and libraries installed:

```sh
$ npm list -g
```

## Info

* `npm root -g` - Path to global node_modules directory

# Cookbook

## Local Development

```
npm install PATH
```

## Use a package from a Bitbucket Repo, Gist, Github Repo or GitLab Repo

```
npm install <bitbucket|github|gist|gitlab>:USER/PROJECT[#COMMITTISH]
```

## Use a package from a GitHub Repo

```
npm install USER/PROJECT[#COMMITTISH]
```

## Publish a package

Use `np`
