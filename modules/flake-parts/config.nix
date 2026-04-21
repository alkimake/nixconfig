# Top-level configuration for everything in this repo.
#
# Values are set in 'config.nix' in repo root.
{lib, ...}: let
  userSubmodule = lib.types.submodule {
    options = {
      username = lib.mkOption {
        type = lib.types.str;
      };
      fullname = lib.mkOption {
        type = lib.types.str;
      };
      email = lib.mkOption {
        type = lib.types.str;
      };
      sshKey = lib.mkOption {
        type = lib.types.str;
        description = ''
          SSH public key
        '';
      };
    };
  };

  themeSubmodule = lib.types.submodule {
    options = {
      flavor = lib.mkOption {
        type = lib.types.enum ["latte" "frappe" "macchiato" "mocha"];
        default = "mocha";
        description = ''
          Default flavor (back-compat); used as darkFlavor if darkFlavor is unset.
        '';
      };
      lightFlavor = lib.mkOption {
        type = lib.types.enum ["latte" "frappe" "macchiato" "mocha"];
        default = "latte";
        description = ''
          Catppuccin flavor used when in light mode.
        '';
      };
      darkFlavor = lib.mkOption {
        type = lib.types.enum ["latte" "frappe" "macchiato" "mocha"];
        default = "mocha";
        description = ''
          Catppuccin flavor used when in dark mode.
        '';
      };
    };
  };

  gitSubmodule = lib.types.submodule {
    options = {
      email = lib.mkOption {
        type = lib.types.str;
        description = ''
          Git email for this host
        '';
      };
      signingKey = lib.mkOption {
        type = lib.types.str;
        description = ''
          GPG signing key for this host
        '';
      };
    };
  };

  hostSubmodule = lib.types.submodule {
    options = {
      theme = lib.mkOption {
        type = themeSubmodule;
        description = ''
          Theme configuration for this host
        '';
      };
      git = lib.mkOption {
        type = gitSubmodule;
        description = ''
          Git configuration for this host
        '';
      };
      shell = lib.mkOption {
        type = lib.types.enum ["zsh" "bash"];
        description = ''
          Default shell for this host
        '';
      };
      hostname = lib.mkOption {
        type = lib.types.str;
        description = ''
          Hostname for this host
        '';
      };
      platform = lib.mkOption {
        type = lib.types.str;
        description = ''
          Platform for this host (e.g., aarch64-darwin, x86_64-linux)
        '';
      };
    };
  };
in {
  imports = [
    ../../config.nix
  ];
  options = {
    me = lib.mkOption {
      type = userSubmodule;
    };
    hosts = lib.mkOption {
      type = lib.types.attrsOf hostSubmodule;
      description = ''
        Host-specific configurations
      '';
    };
  };
}
