# Host Configuration Sample

This file demonstrates how to add a new host to your NixConfig system.

## Step 1: Add Host Configuration to `config.nix`

Add your new host configuration to the `hosts` section in `config.nix`:

```nix
hosts = {
  # ... existing hosts ...
  
  # Your new host configuration
  "your-hostname" = {
    # Theme configuration
    theme = {
      flavor = "mocha";  # Choose from: latte, frappe, macchiato, mocha
    };
    
    # Git configuration
    git = {
      email = "your-email@example.com";
      signingKey = "YOUR_GPG_KEY_ID";  # Your GPG signing key
    };
    
    # Shell configuration
    shell = "zsh";  # Choose from: zsh, nushell, bash
    
    # Host information
    hostname = "your-hostname";
    platform = "aarch64-darwin";  # or "x86_64-linux", "x86_64-darwin", etc.
  };
};
```

## Step 2: Create Host-Specific Configuration Files

### For macOS (Darwin)

Create `configurations/darwin/your-hostname.nix`:

```nix
# See /modules/darwin/* for actual settings
# This file is just *top-level* configuration.
{
  flake,
  pkgs,
  config,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
  
  # Get host-specific configuration
  hostConfig = config.hosts."your-hostname" or null;
  shell = if hostConfig != null then hostConfig.shell else "zsh";
  
  # Map shell name to package
  shellPackage = {
    zsh = pkgs.zsh;
    nushell = pkgs.nushell;
    bash = pkgs.bash;
  }.${shell};
in {
  imports = [
    self.darwinModules.default
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";  # or "x86_64-darwin"
  networking.hostName = "your-hostname";

  # For home-manager to work.
  users.users."ake" = {
    home = "/Users/ake";
    shell = shellPackage;
  };

  # Enable home-manager for "ake" user
  home-manager.users."ake" = {
    imports = [
      (self + /configurations/home/ake.nix)
      (self + /configurations/home/ake.your-hostname.nix)  # Optional host-specific home config
    ];
  };

  system.stateVersion = 5;
}
```

### For NixOS

Create `configurations/nixos/your-hostname/default.nix`:

```nix
# See /modules/nixos/* for actual settings
# This file is just *top-level* configuration.
{
  flake,
  config,
  pkgs,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
  
  # Get host-specific configuration
  hostConfig = config.hosts."your-hostname" or null;
  shell = if hostConfig != null then hostConfig.shell else "zsh";
  
  # Map shell name to package
  shellPackage = {
    zsh = pkgs.zsh;
    nushell = pkgs.nushell;
    bash = pkgs.bash;
  }.${shell};
in {
  imports = [
    self.nixosModules.vm-shared  # or other appropriate modules
    self.nixosModules.common
    self.nixosModules.default
    self.nixosModules.gui
    ./configuration.nix
  ];

  # Override the shell in vm-shared module
  users.users.ake.shell = shellPackage;

  # Enable home-manager for "ake" user
  home-manager.users."ake" = {
    imports = [
      (self + /configurations/home/ake.nix)
      self.homeModules.nixos
    ];
  };
}
```

Create `configurations/nixos/your-hostname/configuration.nix`:

```nix
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').
{
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader configuration
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";

  networking.hostName = "your-hostname"; # Define your hostname.

  system.stateVersion = "24.05"; # Did you read the comment?
}
```

### Optional: Host-Specific Home Configuration

Create `configurations/home/ake.your-hostname.nix` for host-specific home-manager settings:

```nix
{
  flake,
  lib,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    self.homeModules.darwin  # or self.homeModules.nixos
  ];
  
  # Add any host-specific home-manager configurations here
  # For example:
  # programs.some-app.enable = true;
  # home.packages = [ pkgs.some-package ];
}
```

## Step 3: Test Your Configuration

1. **Check the configuration**:
   ```bash
   nix flake check
   ```

2. **Format the files**:
   ```bash
   nix fmt
   ```

3. **Activate the configuration**:
   ```bash
   nix run
   ```

## Available Theme Flavors

- **latte**: Light theme with warm colors
- **frappe**: Medium-dark theme with muted colors  
- **macchiato**: Dark theme with vibrant colors
- **mocha**: Dark theme with rich colors

## Available Shells

- **zsh**: Z shell with extensive customization
- **nushell**: Modern shell with structured data
- **bash**: Traditional Bourne Again Shell

## Example: Adding a Development Server

```nix
hosts = {
  # ... existing hosts ...
  
  "dev-server" = {
    theme = {
      flavor = "mocha";  # Dark theme for server environment
    };
    git = {
      email = "dev@company.com";
      signingKey = "DEV_GPG_KEY_ID";
    };
    shell = "zsh";
    hostname = "dev-server";
    platform = "x86_64-linux";
  };
};
```

## Example: Adding a Personal Laptop

```nix
hosts = {
  # ... existing hosts ...
  
  "personal-laptop" = {
    theme = {
      flavor = "latte";  # Light theme for daytime use
    };
    git = {
      email = "personal@example.com";
      signingKey = "PERSONAL_GPG_KEY_ID";
    };
    shell = "nushell";
    hostname = "personal-laptop";
    platform = "aarch64-darwin";
  };
};
```

## Notes

- The `nix run` command automatically detects your hostname and applies the appropriate configuration
- All theme-related settings (terminal colors, editor themes, etc.) are automatically applied based on your host configuration
- Git email and signing keys are automatically set per host
- Shell preferences are automatically applied to the system
- You can override any settings in the host-specific configuration files if needed 