# Cookbook

## Stop Application

```bash
flyctl scale count 0
```

## SSH access

```bash
fly ssh console
```

## Connect to Database

```bash
fly postgres connect --app {APP_NAME}
```
