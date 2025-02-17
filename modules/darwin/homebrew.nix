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
      "zen-browser"
      "protonvpn"
      "zed"
      "ghostty"

      "font-sf-pro"
      "sf-symbols"
      "aerospace"

      "mysqlworkbench"
    ];
    brews = [
      "mas"
      "lima"
      "switchaudio-osx"
      {
        name = "sketchybar";
        start_service = true;
        restart_service = "changed";
      }
    ];
    masApps = {
      # "Proton Pass for Safari" = 2087098929;
    };
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
  };
}
