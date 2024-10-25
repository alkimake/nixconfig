{ flake, pkgs, lib, ... }:
let
  inherit (flake) inputs;
  inherit (inputs) self;
  nixvim' = inputs.nixvim.packages.${pkgs.system}.default;
  nvim = nixvim'.extend {
    # config.theme = lib.mkForce "jellybeans";
  };

in
{
  home.packages = [
    nvim
  ];
  imports = [
    self.homeModules.default
  ];
  home.username = "ake";
  home.homeDirectory = lib.mkDefault "/${if pkgs.stdenv.isDarwin then "Users" else "home"}/ake";
  home.stateVersion = "22.11";
}
