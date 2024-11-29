{
  flake,
  pkgs,
  lib,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
  inherit (pkgs.stdenv) isDarwin;
  nixvim' = inputs.nixvim.packages.${pkgs.system}.default;
  nvim = nixvim'.extend {
    plugins.avante.settings = {
      claude = {
        endpoint = "https://api.anthropic.com";
        max_tokens = 4096;
        model = "claude-3-5-sonnet-20241022";
        temperature = 0;
      };
      provider = lib.mkForce "claude";
    };
  };
  # systemBaseHomeModules = (
  #   if isDarwin
  #   then self.homeModules.darwin
  #   else self.homeModules.nixos
  # );
in {
  home.packages = [
    nvim
  ];
  imports = [
    self.homeModules.default
  ];
  home.username = "ake";
  home.homeDirectory = lib.mkDefault "/${
    if isDarwin
    then "Users"
    else "home"
  }/ake";
  home.stateVersion = "22.11";
}
