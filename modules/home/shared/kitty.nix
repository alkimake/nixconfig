{
  config,
  ...
}: {
  programs.kitty = {
    enable = true;
    font.name = "JetBrainsMono Nerd Font Mono";
    font.size = 14;
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
      background_opacity = 0.88;

      # Hide the title bar
      hide_window_decorations = "yes";

      window_padding_width = "4";

      enable_audio_bell = "no";

      # scrollback_pager = ''nvim -c "set signcolumn=no showtabline=0" -c "silent write! /tmp/kitty_scrollback_buffer | te cat /tmp/kitty_scrollback_buffer - "'';

      allow_remote_control = "yes";
      listen_on = "unix:/tmp/kitty";
      shell_integration = "enabled";
    };
    extraConfig = ''
      # GENERATED
    '';
  };
}
