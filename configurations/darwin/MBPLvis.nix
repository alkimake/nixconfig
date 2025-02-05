# See /modules/darwin/* for actual settings
# This file is just *top-level* configuration.
{
  flake,
  pkgs,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    self.darwinModules.default
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  networking.hostName = "MBPLvis";

  # For home-manager to work.
  # https://github.com/nix-community/home-manager/issues/4026#issuecomment-1565487545
  users.users."ake" = {
    home = "/Users/ake";
    shell = pkgs.nushell;
  };

  # Enable home-manager for "ake" user
  home-manager.users."ake" = {
    imports = [
      (self + /configurations/home/ake.nix)
      (self + /configurations/home/ake.mbplvis.nix)
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
