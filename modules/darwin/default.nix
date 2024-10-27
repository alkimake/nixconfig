# This is your nix-darwin configuration.
# For home configuration, see /modules/home/*
{flake, ...}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    self.nixosModules.common
    ./homebrew.nix
  ];
  # Use TouchID for `sudo` authentication
  security.pam.enableSudoTouchIdAuth = true;

  # Configure macOS system
  # More mac-silicon-utms => https://github.com/ryan4yin/nix-darwin-kickstarter/blob/main/rich-demo/modules/system.nix
  system = {
    defaults = {
      dock = {
        autohide = true;
        # customize Hot Corners
        wvous-tl-corner = 2; # top-left - Mission Control
        # wvous-tr-corner = 13; # top-right - Lock Screen
        wvous-bl-corner = 3; # bottom-left - Application Windows
        wvous-br-corner = 4; # bottom-right - Desktop
      };

      finder = {
        _FXShowPosixPathInTitle = true; # show full path in finder title
        AppleShowAllExtensions = true; # show all file extensions
        FXEnableExtensionChangeWarning = false; # disable warning when changing file extension
        QuitMenuItem = true; # enable quit menu item
        ShowPathbar = true; # show path bar
        ShowStatusBar = true; # show status bar
      };
    };

    # Configure iTerm2 to run at login silently
    launchd.user.agents.iterm2 = {
      program = "${pkgs.iterm2}/Applications/iTerm.app/Contents/MacOS/iTerm2";
      runAtLoad = true;
      keepAlive = false;
      launchOnlyOnce = true;
      standardOutPath = "/dev/null";    # Suppress output
      standardErrorPath = "/dev/null";  # Suppress errors
    };

    keyboard = {
      # enableKeyMapping = true;
      # remapCapsLockToControl = true;
    };
  };
}
