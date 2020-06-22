self: super:

let
  kernelModuleOverrides = self: super: {
     w1-gpio-cl = self.callPackage ./w1-gpio-cl {};
  };
in

{
  python3 = super.python3.override pythonOverrides;

  # Out-of-tree kernel modules
  linuxPackages_rpi3 = super.linuxPackages_rpi3.extend(
    kernelModuleOverrides
  );
  linuxPackages_rpi4 = super.linuxPackages_rpi4.extend(
    kernelModuleOverrides
  );

  # udev rules
  usb-relay-udev-rules = super.callPackage ./usb-relay-udev-rules {};
  gpiomem-udev-rules = super.callPackage ./gpiomem-udev-rules {};
}
