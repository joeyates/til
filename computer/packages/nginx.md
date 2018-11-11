# Cookbook

## Serve a specific file as default

```
location / {
  try_files $uri /index.html;
}
```
