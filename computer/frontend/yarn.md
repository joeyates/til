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

## Add a Package Specifying a ~ version restriction

```
??? this doesn't seem to work as expected - it adds the dependency,
but without the version limitation
yarn add webpack@2.7.0 --tilde --dev
```

# Publish a package

Use `np`
