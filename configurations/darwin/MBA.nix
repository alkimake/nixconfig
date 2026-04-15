# See /modules/darwin/* for actual settings
# This file is just *top-level* configuration.
{
  flake,
  pkgs,
  config,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
  
  # Get host-specific configuration
  hostConfig = config.hosts.MBA or null;
  shell = if hostConfig != null then hostConfig.shell else "zsh";
  
  # Map shell name to package
  shellPackage = {
    zsh = pkgs.zsh;
    nushell = pkgs.nushell;
    bash = pkgs.bash;
  }.${shell};
in {
  imports = [
    self.darwinModules.default
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  networking.hostName = "MBA";

  # For home-manager to work.
  # https://github.com/nix-community/home-manager/issues/4026#issuecomment-1565487545
  users.users."ake" = {
    home = "/Users/ake";
    shell = shellPackage;
  };

  # Enable home-manager for "ake" user
  home-manager.users."ake" = {
    imports = [
      (self + /configurations/home/ake.nix)
      (self + /configurations/home/ake.mba.nix)
    ];
    
    # Pass host configuration to home-manager
    _module.args = {
      inherit (config) hosts;
      hostname = "MBA";
    };
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
}
