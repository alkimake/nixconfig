_: {
  homebrew = {
    enable = true;

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
    ];
    brews = [
      "mas"
      "lima"
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
