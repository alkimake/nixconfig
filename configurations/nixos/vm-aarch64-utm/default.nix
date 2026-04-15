# See /modules/nixos/* for actual settings
# This file is just *top-level* configuration.
{flake, config, pkgs, ...}: let
  inherit (flake) inputs;
  inherit (inputs) self;
  
  # Get host-specific configuration
  hostConfig = config.hosts."vm-aarch64-utm" or null;
  shell = if hostConfig != null then hostConfig.shell else "zsh";
  
  # Map shell name to package
  shellPackage = {
    zsh = pkgs.zsh;
    nushell = pkgs.nushell;
    bash = pkgs.bash;
  }.${shell};
in {
  imports = [
    self.nixosModules.vm-shared
    self.nixosModules.common
    self.nixosModules.default
    self.nixosModules.gui
    ./configuration.nix
  ];

  # Override the shell in vm-shared module
  users.users.ake.shell = shellPackage;

  # Enable home-manager for "ake" user
  home-manager.users."ake" = {
    imports = [(self + /configurations/home/ake.nix)];
    
    # Pass host configuration to home-manager
    _module.args = {
      inherit (config) hosts;
    };
  };
}
