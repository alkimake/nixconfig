{ config, pkgs, ... }:

{
  home.file.".config/ghostty/config".text = ''
    # Window settings

    # Font configuration
    font-family = "JetBrainsMono Nerd Font Mono"
    font-size = 14

    theme = "catppuccin-mocha"

    # Shell integration
    shell-integration = zsh

    # Misc
    mouse-hide-while-typing = true
    confirm-close-surface = false
  '';
}

