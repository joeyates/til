Create `default.nix`:

```nix
let
  nixpkgs = import <nixpkgs> {};
in
  nixpkgs.wget
```

Install:

```sh
nix-env -f default.nix -i
```
