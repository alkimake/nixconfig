# This is your nix-darwin configuration.
# For home configuration, see /modules/home/*
{
  flake,
  pkgs,
  ...
}: let
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

      # customize trackpad
      trackpad = {
        # tap - 轻触触摸板, click - 点击触摸板
        Clicking = true; # enable tap to click(轻触触摸板相当于点击)
        TrackpadRightClick = true; # enable two finger right click
      };

      finder = {
        _FXShowPosixPathInTitle = true; # show full path in finder title
        AppleShowAllExtensions = true; # show all file extensions
        FXEnableExtensionChangeWarning = false; # disable warning when changing file extension
        QuitMenuItem = true; # enable quit menu item
        ShowPathbar = true; # show path bar
        ShowStatusBar = true; # show status bar
      };
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark"; # dark mode
        "com.apple.keyboard.fnState" = true;
      };
    };

    keyboard = {
      # enableKeyMapping = true;
      # remapCapsLockToControl = true;
    };
  };
}
