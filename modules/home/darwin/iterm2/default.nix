{ config, pkgs, ... }:

{

  # Copy Catppuccin theme to iTerm2 preferences folder
  home.file.".config/iterm2/catppuccin-mocha.itermcolors".source = ./catppuccin-mocha.itermcolors;

  # Enable the iTerm2 program module
  programs.iterm2 = {
    enable = true;

    # Configure iTerm2 settings
    settings = {
      # Enable Guake-style dropdown terminal
      "HotkeyEnabled" = true;
      "HotkeyCharacter" = "`";
      "HotkeyCode" = 50;            # Key code for backtick `
      "HotkeyModifiers" = 1048576;  # Command modifier
      "ToggleWindow" = true;
      "HotkeyTermAnimationDuration" = 0.25;

      # Set default color preset to Catppuccin
      "LoadPrefsFromCustomFolder" = true;
      "PrefsCustomFolder" = "$HOME/.config/iterm2";
    };
    extraInit = ''
      open "$HOME/.config/iterm2/catppuccin-mocha.itermcolors"
    '';
  };

}

