# Global Options

Dokku's bash scripts can be configured via environment variables in a file called
`/home/dokku/dokkurc` or in any file in the `/home/dokku/.dokkurc/` directory.

# Debugging

Turn on `set -x` for **bash** plugins:

```sh
dokku trace:on
```

Turn off:

```sh
dokku trace:off
```

There is also the DOKKU_TRACE environment variable, which **may** work for non-bash plugins

For example, in `/home/dokku/.dokkurc/DOKKU_TRACE`:

```bash
export DOKKU_TRACE=1
```

# Set the Default Git Branch to 'main'

```sh
dokku git:set --global deploy-branch main
```

