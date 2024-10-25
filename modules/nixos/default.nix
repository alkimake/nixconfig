# This is your nixos configuration.
# For home configuration, see /modules/home/*
{flake, ...}: let
  inherit (flake) inputs;
in {
  services.openssh.enable = true;
}
