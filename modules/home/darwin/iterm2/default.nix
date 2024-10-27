{ config, pkgs, ... }:

{
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
      "PrefsCustomFolder" = "$HOME/.iterm2";
    };
  };

  # Copy Catppuccin theme to iTerm2 preferences folder
  home.file.".iterm2/catppuccin-mocha.itermcolors".source = ./catppuccin-mocha.itermcolors;

  # Install iTerm2 theme
  programs.iterm2.extraInit = ''
    open "$HOME/.iterm2/catppuccin-mocha.itermcolors"
  '';

  # Configure iTerm2 to run at login silently
  launchd.user.agents.iterm2 = {
    program = "${pkgs.iterm2}/Applications/iTerm.app/Contents/MacOS/iTerm2";
    runAtLoad = true;
    keepAlive = false;
    launchOnlyOnce = true;
    standardOutPath = "/dev/null";    # Suppress output
    standardErrorPath = "/dev/null";  # Suppress errors
  };
}

