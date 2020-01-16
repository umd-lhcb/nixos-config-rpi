{ stdenv, fetchgit, fetchpatch, kernel }:

stdenv.mkDerivation {
  name = "w1-gpio-cl-${kernel.version}";

  src = fetchgit {
    url = "git://github.com/pstolarz/w1-gpio-cl.git";
    rev = "8681afc7d9f764ed16d2182f2a3b3daac4a2e309";
    sha256 = "15nsx8nyxr96p06xaizn7ixy5ak5wc2z5ywk5ylys2adwhrlh61n";
  };

  hardeningDisable = [ "pic" ];

  nativeBuildInputs = kernel.moduleBuildDependencies;

  preBuild = ''
    sed -e "s@/lib/modules/\$(.*)@${kernel.dev}/lib/modules/${kernel.modDirVersion}@" -i Makefile
  '';

  installPhase = ''
    mkdir -p $out/lib/modules/${kernel.modDirVersion}/kernel/drivers/w1/masters
    cp w1-gpio-cl.ko $out/lib/modules/${kernel.modDirVersion}/kernel/drivers/w1/masters
  '';
}
