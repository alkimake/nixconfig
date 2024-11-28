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

      cursor = "#${base06}";
      cursor_text_color = "background";

      url_color = "#${base0D}";

      visual_bell_color = "#${base0C}";
      bell_border_color = "#${base0C}";

      active_border_color = "#${base0E}";
      inactive_border_color = "#${base03}";

      foreground = "#${base06}";
      background = "#${base00}";
      selection_foreground = "#${base02}";
      selection_background = "#${base06}";

      active_tab_foreground = "#${base06}";
      active_tab_background = "#${base03}";
      inactive_tab_foreground = "#${base04}";
      inactive_tab_background = "#${base01}";

      # = "black  (bg3/bg4)";
      color0 = "#${base03}";
      color8 = "#${base04}";

      # = "red";
      color1 = "#${base08}";
      color9 = "#${base08}";

      #: = "green";
      color2 = "#${base0B}";
      color10 = "#${base0B}";

      # = "yellow";
      color3 = "#${base0A}";
      color11 = "#${base0A}";

      # = "blue";
      color4 = "#${base0D}";
      color12 = "#${base0D}";

      # = "purple";
      color5 = "#${base0E}";
      color13 = "#${base0E}";

      # = "aqua";
      color6 = "#${base0C}";
      color14 = "#${base0C}";

      # = "white (fg4/fg3)";
      color7 = "#${base05}";
      color15 = "#${base06}";

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
