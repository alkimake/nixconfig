# NixConfig

A comprehensive Nix configuration supporting multiple hosts and users with automatic hostname detection.

## Features

- **Multi-host support**: Automatic configuration based on hostname
- **Theme customization**: Per-host Catppuccin theme flavors (latte, frappe, macchiato, mocha)
- **Git configuration**: Host-specific email and signing keys
- **Shell configuration**: Per-host shell preferences (zsh, nushell, bash)
- **Consistent Nix structure**: Maintains clean separation of concerns

## Quick Start

1. **Clone and enter the configuration**:
   ```bash
   git clone <your-repo-url> nixconfig
   cd nixconfig
   ```

2. **Activate the configuration**:
   ```bash
   nix run
   ```
   
   This command automatically detects your hostname and applies the appropriate configuration.

## Host Configuration System

The configuration uses a centralized host configuration system in `config.nix`. Each host can have its own:

- **Theme flavor**: Choose from Catppuccin flavors (latte, frappe, macchiato, mocha)
- **Git settings**: Email and GPG signing key
- **Shell preference**: zsh, nushell, or bash
- **Platform specification**: aarch64-darwin, x86_64-linux, etc.

### Example Host Configuration

```nix
hosts = {
  MBA = {
    theme = {
      flavor = "latte";  # Light theme for MacBook Air
    };
    git = {
      email = "alkimake@pm.me";
      signingKey = "649D70BEBA8C8C0C";
    };
    shell = "zsh";
    hostname = "MBA";
    platform = "aarch64-darwin";
  };
  
  MBPLvis = {
    theme = {
      flavor = "mocha";  # Dark theme for MacBook Pro
    };
    git = {
      email = "alkim@lviscorp.com";
      signingKey = "0A0FF1A12B507921";
    };
    shell = "nushell";
    hostname = "MBPLvis";
    platform = "aarch64-darwin";
  };
};
```

### Adding a New Host

1. **Add host configuration** to `config.nix`:
   ```nix
   hosts = {
     # ... existing hosts ...
     
     "your-hostname" = {
       theme = {
         flavor = "mocha";  # Choose your preferred theme
       };
       git = {
         email = "your-email@example.com";
         signingKey = "YOUR_GPG_KEY_ID";
       };
       shell = "zsh";  # or "nushell", "bash"
       hostname = "your-hostname";
       platform = "aarch64-darwin";  # or "x86_64-linux"
     };
   };
   ```

2. **Create host-specific configuration files** (if needed):
   - For Darwin: `configurations/darwin/your-hostname.nix`
   - For NixOS: `configurations/nixos/your-hostname/default.nix`
   - For Home: `configurations/home/ake.your-hostname.nix`

3. **Run the configuration**:
   ```bash
   nix run
   ```

## Theme Flavors

The configuration supports all Catppuccin theme flavors:

- **latte**: Light theme with warm colors
- **frappe**: Medium-dark theme with muted colors
- **macchiato**: Dark theme with vibrant colors
- **mocha**: Dark theme with rich colors

The theme is automatically applied to:
- Terminal emulators (kitty, ghostty)
- Shell prompt (starship)
- Text editors (neovim)
- Window managers (tmux)
- Display managers (SDDM)

## Available Commands

- `nix run` - Activate configuration for current host
- `nix fmt` - Format Nix files
- `nix flake check` - Check flake configuration
- `just update` - Update flake inputs
- `just lint` - Lint Nix files
- `just check` - Check flake configuration

## Supported Hosts

Currently configured hosts:
- **MBA**: MacBook Air with latte theme
- **MBPLvis**: MacBook Pro with mocha theme
- **mac-silicon-utm**: UTM VM with frappe theme
- **vm-qemu**: QEMU VM with macchiato theme
- **vm-aarch64-utm**: ARM UTM VM with mocha theme

## Architecture

The configuration uses [nixos-unified](https://nixos-unified.org/) for automatic hostname detection and configuration wiring. The structure follows:

```
├── config.nix                    # Central host configuration
├── modules/
│   ├── flake-parts/             # Flake configuration
│   ├── home/shared/             # Shared home-manager modules
│   ├── darwin/                  # macOS-specific modules
│   └── nixos/                   # NixOS-specific modules
└── configurations/
    ├── darwin/                  # macOS host configurations
    ├── home/                    # Home-manager configurations
    └── nixos/                   # NixOS host configurations
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test with `nix run`
5. Submit a pull request

## License

This configuration is provided as-is for educational and personal use.
