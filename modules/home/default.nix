# A module that automatically imports everything else in the parent folder.
# This module conditionally ignores certain files based on the operating system.

{ pkgs, ... }:

{
  imports =
    let
      excludeDirs = if pkgs.stdenv.isDarwin then ["nixos-only"]
                    else if pkgs.stdenv.isLinux then ["darwin-only"]
                    else [];
      files = builtins.attrNames (builtins.readDir ./.);
      filteredFiles = builtins.filter
        (fn: fn != "default.nix" && !(builtins.elem fn excludeDirs))
        files;
    in
    map (fn: ./${fn}) filteredFiles;
}
