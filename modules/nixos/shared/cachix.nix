{
  nix.settings.trusted-public-keys = [
    "ake-nixos-config.cachix.org-1:CiM0xLg1ECceA4PNgDbFCq4tK2xUKdh76cMG5m0y6A0="
    "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
  ];
  nix.settings.substituters = [
    "https://ake-nixos-config.cachix.org"
    "https://hyprland.cachix.org"
  ];
}
