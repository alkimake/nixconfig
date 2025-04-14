{
  config,
  ...
}: {
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font Mono";
    font.size = 12;
    # keybindings = {
    #   "kitty_mod+h" = "neighboring_window left";
    #   "kitty_mod+l" = "neighboring_window right";
    #   "kitty_mod+j" = "neighboring_window down";
    #   "kitty_mod+k" = "neighboring_window up";
    # };
    shellIntegration.enableZshIntegration = true;
    settings = with config.colorScheme.palette; {
      # On macos use the option key as Alt
      macos_option_as_alt = true;

      # Lets try transparency
      background_opacity = 0.95;

      # Hide the title bar
      hide_window_decorations = "yes";

      window_padding_width = "4";

      enable_audio_bell = "no";

      # scrollback_pager = ''nvim -c "set signcolumn=no showtabline=0" -c "silent write! /tmp/kitty_scrollback_buffer | te cat /tmp/kitty_scrollback_buffer - "'';

      allow_remote_control = "yes";
      listen_on = "unix:/tmp/kitty";
      shell_integration = "enabled";

      # Quake style dropdown terminal settings
      quake = {
        window_type = "desktop";
        window_padding_width = "0";
        window_margin_width = "0";
        window_border_width = "0";
        window_opacity = 0.95;
        window_height = "50%";
        window_width = "100%";
        window_position = "top";
      };
    };
    keybindings = {
      "ctrl+shift+space" = "toggle_window";
      "cmd+shift+return" = "kitty --single-instance --title 'quake' --config 'quake'";
    };
    extraConfig = ''
      # GENERATED
    '';
  };
}
