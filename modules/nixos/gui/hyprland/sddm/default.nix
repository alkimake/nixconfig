{
  pkgs,
  flake,
  config,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
  
  # Get the current hostname and use it to determine theme flavor
  hostname = config.networking.hostName or "unknown";
  hostConfig = config.hosts.${hostname} or null;
  
  # Default to mocha if no host-specific config is found
  flavor = if hostConfig != null then hostConfig.theme.flavor else "mocha";
  
  theme = "catppuccin-${flavor}";
in {
  services.xserver = {
    enable = true;
  };

  services.displayManager.sddm = {
    enable = true;
    theme = theme;
    package = pkgs.kdePackages.sddm;
  };

  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    (catppuccin-sddm.override
      {
        flavor = flavor;
        font = "Noto Sans";
        fontSize = "9";
        background = self + /assets/wallpapers/login.png;
        loginBackground = true;
      })
  ];
}
