{flake, ...}: let
  flavor = "mocha";
in {
  imports = [
    flake.inputs.nix-colors.homeManagerModules.default
    flake.inputs.catppuccin.homeManagerModules.catppuccin
  ];
  colorScheme = flake.inputs.nix-colors.colorSchemes.catppuccin-mocha;
  catppuccin = {
    inherit flavor;
    bat.enable = true;
    lazygit.enable = true;
    delta.enable = true;
    btop.enable = true;
    fzf.enable = true;
    starship.enable = true;
    zsh-syntax-highlighting.enable = true;
    zed.enable = true;
    yazi.enable = true;
    k9s.enable = true;
    kitty.enable = true;
  };
}
