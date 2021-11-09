# Basics

## Update a package

```
yarn upgrade {{name}}@{{version}}
```

# Global

Install

```
yarn global add {{package}}
```

Install a local package

```sh
yarn global add file:$PWD
```

Uninstall

```
yarn global remove {{package}}
```

List

```sh
yarn global list
```

Install path

```
yarn config get prefix
```

# Cookbook

## Install in a directory dofferent ot the current directory

```sh
yarn --cwd 'assets'
```

## Query the installed version of a package

```sh
yarn why {{package}}
```

## Add a Package Specifying a ~ version restriction

```
??? this doesn't seem to work as expected - it adds the dependency,
but without the version limitation
yarn add webpack@2.7.0 --tilde --dev
```

## Publish a package

Use `np`
