{ config, pkgs, hosts, hostname, ... }: let
  # Get the current hostname and use it to determine theme flavor
  # Use the hostname passed from the darwin configuration
  hostConfig = hosts.${hostname} or null;
  
  # Debug: let's see what we're getting
  debug = builtins.trace "Ghostty debug: hostname=${hostname}, hostConfig=${builtins.toJSON hostConfig}" null;
  
  # Default to mocha if no host-specific config is found
  flavor = if hostConfig != null then hostConfig.theme.flavor else "mocha";
  
  theme = "Catppuccin Mocha";
in {
  home.file.".config/ghostty/config".text = ''
    # Window settings

    # Font configuration
    font-family = "JetBrainsMono Nerd Font Mono"
    font-size = 14

    theme = "${theme}"

    # Shell integration
    shell-integration = zsh

    # Misc
    mouse-hide-while-typing = true
    confirm-close-surface = false
  '';
}
