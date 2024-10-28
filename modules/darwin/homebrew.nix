{...}: let
in {
  homebrew = {
    enable = true;
    casks = [
      "spotify"
      "proton-pass"
    ];
    brews = [
      "mas"
    ];
    masApps = {
      # "Proton Pass for Safari" = 2087098929;
    };
    onActivation.cleanup = "zap";
  };
}
