# This is your nixos configuration.
# For home configuration, see /modules/home/*
{
  imports = [
    ../flake-parts/config.nix
  ];
  
  services.openssh.enable = true;
}
