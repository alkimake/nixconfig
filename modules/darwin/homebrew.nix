_: {
  homebrew = {
    enable = true;

    taps = [
      "homebrew/services"
      "FelixKratz/formulae"
      "nikitabobko/tap"
    ];

    casks = [
      "spotify"
      "proton-pass"
      "slack"
      "kitty"
      "google-chrome"
      "obsidian"
      "utm"
      "cursor"
      "protonvpn"
      "zed"
      "ghostty"
      "wireshark"

      "font-sf-pro"
      "sf-symbols"

      "mysqlworkbench"

      "claude-code"
    ];
    brews = [
      # "ruby"  # Removed - macOS already provides Ruby, causing conflicts
      "mas"
      "lima"
      "switchaudio-osx"
    ];
    masApps = {
      # "Proton Pass for Safari" = 2087098929;
    };
    onActivation = {
      autoUpdate = true;
      cleanup = "none";
      upgrade = true;
    };
  };
}
