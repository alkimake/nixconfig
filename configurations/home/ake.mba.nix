{flake, ...}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    self.homeModules.darwin
  ];
  programs.git.signing.key = "649D70BEBA8C8C0C";
}
