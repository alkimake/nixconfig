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
    ];
    brews = [
      "mas"
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
