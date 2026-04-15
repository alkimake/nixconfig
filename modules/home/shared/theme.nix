{flake, config, ...}: let
  # Get the current hostname and use it to determine theme flavor
  hostname = config.networking.hostName or "unknown";
  hostConfig = config.hosts.${hostname} or null;

  # Read the active mode (light|dark) from the repo-root .theme-mode file.
  # Path is relative to this file: modules/home/shared/theme.nix → repo root.
  modeRaw = builtins.readFile ../../../.theme-mode;
  mode = builtins.replaceStrings ["\n" " " "\t"] ["" "" ""] modeRaw;

  light = if hostConfig != null then hostConfig.theme.lightFlavor else "latte";
  dark  = if hostConfig != null then hostConfig.theme.darkFlavor  else "mocha";

  flavor = if mode == "light" then light else dark;

  # Map flavor to color scheme
  colorSchemeMap = {
    latte = flake.inputs.nix-colors.colorSchemes.catppuccin-latte;
    frappe = flake.inputs.nix-colors.colorSchemes.catppuccin-frappe;
    macchiato = flake.inputs.nix-colors.colorSchemes.catppuccin-macchiato;
    mocha = flake.inputs.nix-colors.colorSchemes.catppuccin-mocha;
  };

  colorScheme = colorSchemeMap.${flavor};
in {
  imports = [
    flake.inputs.nix-colors.homeManagerModules.default
    flake.inputs.catppuccin.homeModules.catppuccin
  ];
  colorScheme = colorScheme;
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
