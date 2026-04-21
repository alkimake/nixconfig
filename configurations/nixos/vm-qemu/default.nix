# See /modules/nixos/* for actual settings
# This file is just *top-level* configuration.
{
  flake,
  config,
  pkgs,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
  
  # Get host-specific configuration
  hostConfig = config.hosts."vm-qemu" or null;
  shell = if hostConfig != null then hostConfig.shell else "zsh";
  
  # Map shell name to package
  shellPackage = {
    zsh = pkgs.zsh;
    bash = pkgs.bash;
  }.${shell};
in {
  imports = [
    self.nixosModules.vm-shared
    self.nixosModules.common
    self.nixosModules.default
    self.nixosModules.gui
    (self + /modules/nixos/gui/gnome)
    ./configuration.nix
  ];

  # Override the shell in vm-shared module
  users.users.ake.shell = shellPackage;

  # Forward `flake` to home-manager modules (they expect it as a module arg).
  home-manager.extraSpecialArgs = { inherit flake; };

  # Enable home-manager for "ake" user
  home-manager.users."ake" = {
    imports = [
      (self + /configurations/home/ake.nix)
      self.homeModules.nixos
    ];

    # Pass host configuration to home-manager
    _module.args = {
      inherit (config) hosts;
      hostname = "vm-qemu";
    };
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
