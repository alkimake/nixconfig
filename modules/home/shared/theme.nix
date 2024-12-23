{flake, ...}: let
  flavor = "mocha";
in {
  imports = [
    flake.inputs.nix-colors.homeManagerModules.default
    flake.inputs.catppuccin.homeManagerModules.catppuccin
  ];
  colorScheme = flake.inputs.nix-colors.colorSchemes.catppuccin-mocha;
  catppuccin.flavor = flavor;
  programs = {
    bat.catppuccin.enable = true;
    lazygit.catppuccin.enable = true;
    git.delta.catppuccin.enable = true;
    btop.catppuccin.enable = true;
    fzf.catppuccin.enable = true;
    starship.catppuccin.enable = true;
    zsh.syntaxHighlighting.catppuccin.enable = true;
    yazi.catppuccin.enable = true;
    k9s.catppuccin.enable = true;
    kitty.catppuccin.enable = true;
  };
}
