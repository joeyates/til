# Install

## Set up Nix in Single User Mode

```
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

macOS (>= 10.15)

```sh
sh <(curl -L https://nixos.org/nix/install) --no-daemon --darwin-use-unencrypted-nix-store-volume
```

This modifies shell configuration to initialize Nix.

## Set up Nix in multi-user mode

on Linux

```sh
curl -L https://nixos.org/nix/install | sh
```

or on macOS

```sh
sh <(curl -L https://nixos.org/nix/install) --darwin-use-unencrypted-nix-store-volume
```

## Don't add Nix to Shell configuration During Installation

Set NIX_INSTALLER_NO_MODIFY_PROFILE

# Uninstall

## pre-uninstall on macOS

sudo launchctl unload /Library/LaunchDaemons/org.nixos.nix-daemon.plist
sudo rm /Library/LaunchDaemons/org.nixos.nix-daemon.plist

## All

  1. Remove the entry from fstab using 'sudo vifs'
  2. Destroy the data volume using 'diskutil apfs deleteVolume /nix'
  3. Remove the 'nix' line from /etc/synthetic.conf or the file
    sudo vim /etc/synthetic.conf
    or
    sudo rm /etc/synthetic.conf

4. Remove the line adedd to ~/.bash_profile (or .bashrc)

## post-uninstall on macOS

for num in {1..32}; do sudo dscl . -delete /Users/nixbld$num; done
sudo dscl . -delete /Groups/nixbld

Note: the /nix directory disappeared after a reboot

# nix Files

* $HOME/.nix-profile/bin/ - symlinks to installed packages
* /nix - store and var

#nix-shell

Create a shell:

nix-shell --packages {{package}}

# nix client

## Search

nix search <text>

# Channels

Channels are sources of Nix packages

List channels:

nix-channel --list

# Secrets

https://nixos.wiki/wiki/Comparison_of_secret_managing_schemes

# Resources

* https://nixos.wiki/
