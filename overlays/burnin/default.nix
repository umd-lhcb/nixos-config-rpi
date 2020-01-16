self: super:

let
  pythonOverrides = {
    packageOverrides = self: super: {
      RPi.GPIO = super.callPackage ./RPi.GPIO {};
    };
  };
in

{
  python3 = super.python3.override pythonOverrides;

  linuxPackages_rpi4 = super.linuxPackages_rpi4.extend(
    lpself: lpsuper: {
      w1-gpio-cl = lpself.callPackage ./w1-gpio-cl {};
  });
}
