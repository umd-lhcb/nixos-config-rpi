{ stdenv }:

stdenv.mkDerivation rec {
  pname = "gpiomem-udev-rules";
  version = "20200129";

  src = ./99-gpiomem.rules;

  # Remove all but installPhase
  phases = [ "installPhase" ];

  installPhase = ''
    install -D $src $out/lib/udev/rules.d/99-gpiomem.rules
  '';
}
