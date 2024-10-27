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
    # config.theme = lib.mkForce "jellybeans";
  };
  systemBaseHomeModules = (
    if isDarwin
    then self.homeModules.darwin
    else self.homeModules.nixos
  );
in {
  home.packages = [
    nvim
  ];
  imports = [
    self.homeModules.default
    systemBaseHomeModules
  ];
  home.username = "ake";
  home.homeDirectory = lib.mkDefault "/${
    if isDarwin
    then "Users"
    else "home"
  }/ake";
  home.stateVersion = "22.11";
}
