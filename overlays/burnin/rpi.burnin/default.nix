{ stdenv, buildPythonPackage, fetchgit, RPi_GPIO, hidapi }:

buildPythonPackage rec {
  pname = "rpi.burnin";
  version = "0.3";

  src = fetchgit {
    url = "https://github.com/umd-lhcb/rpi.burnin";
    rev = version;
    sha256 = "1q5f2520i8kiqwpxxy2ajb7iz98v6bvvi6nilw9zd0bxbmsfkcva";
  };

  propagatedBuildInputs = [
    RPi_GPIO
    hidapi
  ];

  # No check avaliable
  doCheck = false;
}
