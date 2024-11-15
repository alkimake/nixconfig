{
  flake,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    self.homeModules.darwin
  ];
  programs.git.signing.key = "0A0FF1A12B507921";
}
