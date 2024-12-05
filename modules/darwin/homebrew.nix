_: {
  homebrew = {
    enable = true;

    taps = [
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

      "font-sf-pro"
      "sf-symbols"
      "aerospace"
    ];
    brews = [
      "mas"
      "lima"
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
