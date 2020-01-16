self: super:

let
  pythonOverrides = {
    packageOverrides = self: super: {
      RPi.GPIO = super.callPackage ./RPi.GPIO {};
    };
  };

  kernelModuleOverrides = self: super: {
     w1-gpio-cl = self.callPackage ./w1-gpio-cl {};
  };
in

{
  python3 = super.python3.override pythonOverrides;

  # Out-of-tree kernel modules
  linuxPackages_rpi4 = super.linuxPackages_rpi4.extend(
    kernelModuleOverrides
  );

  # udev rules
  usb-relay-udev-rules = super.callPackage ./usb-relay-udev-rules {};
}
