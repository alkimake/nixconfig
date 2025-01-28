_: {
  imports = [
    ./monitors.nix
    ./sddm
  ];
  programs.hyprland.enable = true; # enable Hyprland
}
