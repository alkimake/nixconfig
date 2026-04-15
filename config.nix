# Configuration for this repo
# See ./modules/flake-parts/config.nix for module options.
{
  me = {
    username = "ake";
    fullname = "Alkim Ake Gozen";
    email = "alkimake@pm.me";
    sshKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICLCWzMu7fYnjS3zf3Boch31kszNxomELBINItRxcHKB";
  };

  # Host-specific configurations
  hosts = {
    # MBA (MacBook Air) configuration
    MBA = {
      # Theme configuration
      theme = {
        flavor = "mocha";  # Change from mocha to latte for MBA
        # Available flavors: latte, frappe, macchiato, mocha
      };
      
      # Git configuration
      git = {
        email = "alkimake@pm.me";
        signingKey = "649D70BEBA8C8C0C";
      };
      
      # Shell configuration
      shell = "zsh";
      
      # Additional host-specific settings
      hostname = "MBA";
      platform = "aarch64-darwin";
    };

    # MBPLvis configuration
    MBPLvis = {
      # Theme configuration
      theme = {
        flavor = "mocha";  # Keep mocha for MBPLvis
      };
      
      # Git configuration
      git = {
        email = "alkim@lviscorp.com";
        signingKey = "0A0FF1A12B507921";
      };
      
      # Shell configuration
      shell = "nushell";
      
      # Additional host-specific settings
      hostname = "MBPLvis";
      platform = "aarch64-darwin";
    };

    # mac-silicon-utm configuration
    "mac-silicon-utm" = {
      # Theme configuration
      theme = {
        flavor = "frappe";  # Use frappe for UTM VM
      };
      
      # Git configuration
      git = {
        email = "alkimake@pm.me";
        signingKey = "649D70BEBA8C8C0C";
      };
      
      # Shell configuration
      shell = "zsh";
      
      # Additional host-specific settings
      hostname = "mac-silicon-utm";
      platform = "aarch64-darwin";
    };

    # VM configurations
    "vm-qemu" = {
      # Theme configuration
      theme = {
        flavor = "macchiato";  # Use macchiato for QEMU VM
      };
      
      # Git configuration
      git = {
        email = "alkimake@pm.me";
        signingKey = "649D70BEBA8C8C0C";
      };
      
      # Shell configuration
      shell = "zsh";
      
      # Additional host-specific settings
      hostname = "vm-qemu";
      platform = "x86_64-linux";
    };

    "vm-aarch64-utm" = {
      # Theme configuration
      theme = {
        flavor = "mocha";  # Use mocha for aarch64 UTM VM
      };
      
      # Git configuration
      git = {
        email = "alkimake@pm.me";
        signingKey = "649D70BEBA8C8C0C";
      };
      
      # Shell configuration
      shell = "zsh";
      
      # Additional host-specific settings
      hostname = "vm-aarch64-utm";
      platform = "aarch64-linux";
    };
  };
}
