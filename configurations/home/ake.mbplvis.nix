{
  flake,
  lib,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    self.homeModules.darwin
  ];
  programs.git.signing.key = lib.mkForce "0A0FF1A12B507921";
}
