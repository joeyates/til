# Cookbook

## Make a Swap File

```
NUMBER_OF_GIGS=5
PATH_TO_SWAPFILE=/mnt/swapfile
dd if=/dev/zero of=$PATH_TO_SWAPFILE bs=1G count=$NUMBER_OF_GIGS
chmod 0600 $PATH_TO_SWAPFILE
mkswap $PATH_TO_SWAPFILE
swapon $PATH_TO_SWAPFILE
```

For persistance: add to fstab
