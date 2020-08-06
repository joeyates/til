# Install

apt install apache2-utils

# Create .htpasswd File

```sh
htpasswd -bcB {{filename}} {{user}} {{password}}
```

# Print result

```sh
htpasswd -ncB {{user}} {{password}}
```
