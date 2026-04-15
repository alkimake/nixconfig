{
  pkgs,
  lib,
  ...
}: {
  programs.neovide = {
    # Neovide on Linux requires wayland, which is not available on macOS
    enable = lib.mkDefault (!pkgs.stdenv.isDarwin);
    settings = {
      theme = "auto";
      fork = true;
    };
  };
}
