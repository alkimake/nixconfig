# A module that automatically imports everything else in the parent folder.
# This module conditionally ignores certain files based on the operating system.

{ pkgs, ... }:
{
  imports = with builtins; 
    let
      # Filter out files based on the operating system
      isDarwin = pkgs.stdenv.isDarwin;
      isNixos = pkgs.stdenv.isLinux;
      files = filter (fn: 
        (isDarwin && !builtins.match "nixos-.*" fn) || 
        (isNixos && !builtins.match "darwin-.*" fn)
      ) (attrNames (readDir ./.));
    in map (fn: ./${fn}) files;
}
