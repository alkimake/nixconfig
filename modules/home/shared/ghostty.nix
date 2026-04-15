{ config, pkgs, hosts, hostname, ... }: let
  hostConfig = hosts.${hostname} or null;

  # Read active mode (light|dark) from repo-root .theme-mode.
  # Path is relative to this file: modules/home/shared/ghostty.nix → repo root.
  modeRaw = builtins.readFile ../../../.theme-mode;
  mode = builtins.replaceStrings ["\n" " " "\t"] ["" "" ""] modeRaw;

  light = if hostConfig != null then hostConfig.theme.lightFlavor else "latte";
  dark  = if hostConfig != null then hostConfig.theme.darkFlavor  else "mocha";
  flavor = if mode == "light" then light else dark;

  ghosttyTheme = {
    latte = "Catppuccin Latte";
    frappe = "Catppuccin Frappe";
    macchiato = "Catppuccin Macchiato";
    mocha = "Catppuccin Mocha";
  }.${flavor};
in {
  home.file.".config/ghostty/config".text = ''
    # Window settings

    # Font configuration
    font-family = "JetBrainsMono Nerd Font Mono"
    font-size = 14

    theme = "${ghosttyTheme}"

    # Shell integration
    shell-integration = zsh

    # Misc
    mouse-hide-while-typing = true
    confirm-close-surface = false
  '';
}
