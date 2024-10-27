{flake, ...}: {
  imports = [
    flake.inputs.nix-colors.homeManagerModules.default
    flake.inputs.catppuccin.homeManagerModules.catppuccin
  ];
  colorScheme = flake.inputs.nix-colors.colorSchemes.catppuccin-mocha;
}
