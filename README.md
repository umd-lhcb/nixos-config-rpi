# nixos-config-rpi
NixOS configuration for Raspberry Pi used in burn-in.


## Installation
Download the latest `nixOS` `aarch64` release from [1]. Note that this is
officially termed as 'unstable', but should be sufficient in our case. This
branch can be used as a rolling release.

Write the image to an SD card. In Linux, suppose we have a sdcard `mmcblk0`
with 2 partitions `mmcblk0p1` and `mmcblk0p1`, then we should write to
`mmcblk0`, **not** either of the partitions, with the following command:
```
sudo dd if=<nixos.img> of=/dev/mmcblk0
```
On first boot, the rootfs will be automatically resized to use all available
spaces of the SD card.


[1]: https://hydra.nixos.org/job/nixos/trunk-combined/nixos.sd_image.aarch64-linux
