{ stdenv }:

stdenv.mkDerivation rec {
  pname = "usb-relay-udev-rules";
  version = "20200116";

  src = ./50-usb-relay-dct-tech.rules;

  # Remove all but installPhase
  phases = [ "installPhase" ];

  installPhase = ''
    install -D $src $out/lib/udev/rules.d/50-usb-relay-dct-tech.rules
  '';
}
