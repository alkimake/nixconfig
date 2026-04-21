{
  description = "A home-manager template providing useful tools & settings for Nix-based development";

  inputs = {
    # Principle inputs (updated by `nix run .#update`)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";

    # Software inputs
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:alkimake/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };

    #Theme
    catppuccin.url = "github:catppuccin/nix";
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = inputs@{ self, flake-parts, nixpkgs, nix-darwin, home-manager, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];

      imports = [
        ./modules/flake-parts/config.nix
        ./modules/flake-parts/devshell.nix
        ./modules/flake-parts/toplevel.nix
      ];

      flake = {
        overlays = import ./overlays;

        # Export darwin modules
        darwinModules.default = ./modules/darwin;

        # Export nixos modules
        nixosModules = {
          default = ./modules/nixos;
          common = ./modules/nixos/common.nix;
          vm-shared = ./modules/nixos/vm-shared.nix;
          gui = ./modules/nixos/gui;
        };

        # Export home-manager modules
        homeModules = {
          default = ./modules/home;
          nixos = ./modules/home/nixos.nix;
          darwin = ./modules/home/darwin.nix;
        };

        # Darwin configurations
        darwinConfigurations = {
          "MBPLvis" = nix-darwin.lib.darwinSystem {
            specialArgs = { flake = { inherit inputs; }; };
            modules = [
              home-manager.darwinModules.home-manager
              ./configurations/darwin/MBPLvis.nix
            ];
          };

          "MBA" = nix-darwin.lib.darwinSystem {
            specialArgs = { flake = { inherit inputs; }; };
            modules = [
              home-manager.darwinModules.home-manager
              ./configurations/darwin/MBA.nix
            ];
          };

          "mac-silicon-utm" = nix-darwin.lib.darwinSystem {
            specialArgs = { flake = { inherit inputs; }; };
            modules = [
              home-manager.darwinModules.home-manager
              ./configurations/darwin/mac-silicon-utm.nix
            ];
          };
        };

        # NixOS configurations
        nixosConfigurations = {
          "vm-aarch64-utm" = nixpkgs.lib.nixosSystem {
            specialArgs = { flake = { inherit inputs; }; };
            modules = [
              home-manager.nixosModules.home-manager
              ./configurations/nixos/vm-aarch64-utm
            ];
          };

          "vm-qemu" = nixpkgs.lib.nixosSystem {
            specialArgs = { flake = { inherit inputs; }; };
            modules = [
              home-manager.nixosModules.home-manager
              ./configurations/nixos/vm-qemu
            ];
          };
        };
      };
    };
}
