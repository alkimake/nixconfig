{
  pkgs,
  lib,
  ...
}: {
  home = {
    activation.sketchybar = lib.hm.dag.entryAfter ["writeBoundary"] "${pkgs.sketchybar}/bin/sketchybar --reload";

    file.".config/sketchybar".source = ./config;
  };
}
