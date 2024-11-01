{...}: let
in {
  homebrew = {
    enable = true;

    casks = [
      "spotify"
      "proton-pass"
      "slack"
      "kitty"
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
