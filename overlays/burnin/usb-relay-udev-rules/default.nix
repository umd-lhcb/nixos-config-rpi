{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "usb-relay-udev-rules";
  version = "20200116";

  src = ./50-usb-relay-dct-tech.rules

  installPhase = ''
    install -D 50-usb-relay-dct-tech.rules $out/lib/udev/rules.d/50-usb-relay-dct-tech.rules
  '';
}
