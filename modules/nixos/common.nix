# Common to Linux & darwin
{pkgs, ...}: {
  imports = [
    ./shared
    ../../shared/packages.nix
  ];
}
