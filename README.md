# nixos-config-rpi
NixOS configuration for Raspberry Pi used in burn-in. This branch works for rpi
3 only.


## Installation
First, install NixOS on a rpi4 with the ![`rpi4`](https://github.com/umd-lhcb/nixos-config-rpi/blob/rpi4/README.md) instruction.
On the working rpi4 installation, check out the `rpi3` branch:
```
cd /etc/nixos
git fetch origin
git checkout rpi3
```

Before proceed, remove all files in the `/boot` partition with `rm -rf /boot/*`. This
is because the `/boot` partition is too small and can't fit the pending rpi3
kernel.

Now rebuild the system with the rpi4. This takes ~3 hrs, because the rpi3 kernel needs
manual compilation:
```
nixos-rebuild switch
```
After that, poweroff rpi4 and insert this SD card into a rpi3 system.


## System configuration
Please refer to the ![`rpi4`](https://github.com/umd-lhcb/nixos-config-rpi/blob/rpi4/README.md) instruction.
Everything there applies.
