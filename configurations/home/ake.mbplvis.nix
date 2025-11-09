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
  # Git configuration is now handled by the shared git module using host-specific settings
}
