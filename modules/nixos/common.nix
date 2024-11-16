# Common to Linux & darwin
{pkgs, ...}: {
  imports = [
    ./shared/fonts.nix
    ./shared/nix.nix
    ./shared/cachix.nix
    ./shared/tailscale.nix
    ./shared/zsh.nix
  ];
  environment.systemPackages = with pkgs; [
    go
  ];
}
