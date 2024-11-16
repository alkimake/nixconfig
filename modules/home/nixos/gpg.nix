{pkgs, ...}: {
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 34560000;
    maxCacheTtl = 34560000;
    pinentryPackage = pkgs.pinentry-curses;
    enableScDaemon = false;
  };
  programs.gpg = {
    enable = true;
  };
  # Optional: Set GPGTTY environment variable for SSH sessions
  home.sessionVariables = {
    GPGTTY = "$(tty)";
  };
}
