{
  perSystem = { pkgs, ... }: {
    devShells.default = pkgs.mkShell {
      name = "nixconfig-shell";
      meta.description = "Shell environment for modifying this Nix configuration";
      packages = with pkgs; [
        just
        nixd
      ];
    };
  };
}
