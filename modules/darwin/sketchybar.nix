{pkgs, ...}: {
  fonts.packages = [ pkgs.sketchybar-app-font ];
  system.defaults.NSGlobalDomain._HIHideMenuBar = true;
}
