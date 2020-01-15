self: super:

let
  pythonOverrides = {
    packageOverrides = self: super: {
      RPi.GPIO = super.callPackage ./RPi.GPIO { };
    };
  };
in

{
  python3 = super.python3.override pythonOverrides;
}
