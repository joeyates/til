# Basics

## Update a package

```
yarn upgrade {{name}}@{{version}}
```

# Cookbook

## Install a Global Package

```
yarn global add {{package}}
```

## Add a Package Specifying a ~ version restriction

```
??? this doesn't seem to work as expected - it adds the dependency,
but without the version limitation
yarn add webpack@2.7.0 --tilde --dev
```
