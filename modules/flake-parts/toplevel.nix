# Top-level flake glue to get our configuration working
{ ... }:

{
  perSystem = { pkgs, ... }: {
    # For 'nix fmt'
    formatter = pkgs.nixpkgs-fmt;
  };
}
