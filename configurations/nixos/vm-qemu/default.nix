# See /modules/nixos/* for actual settings
# This file is just *top-level* configuration.
{
  flake,
  config,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    self.nixosModules.vm-shared
    self.nixosModules.common
    self.nixosModules.default
    self.nixosModules.gui
    (self + /modules/nixos/gui/gnome)
    ./configuration.nix
  ];

  # Enable home-manager for "ake" user
  home-manager.users."ake" = {
    imports = [
      (self + /configurations/home/ake.nix)
      self.homeModules.nixos
    ];
  };
  # myHomeManager = {
  #   monitors = [
  #     {
  #       name = "Virtual-1";
  #       width = 1920;
  #       height = 1080;
  #       refreshRate = 59.99800;
  #       x = 0;
  #       y = 0;
  #     }
  #   ];
  # };
}
