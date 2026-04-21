# Like GNU `make`, but `just` rustier.
# https://just.systems/
# run `just` from this directory to see available commands

# Default command when 'just' is run without arguments
default:
  @just --list

# Update nix flake
[group('Main')]
update:
  nix flake update

# Lint nix files
[group('dev')]
lint:
  nix fmt

# Check nix flake
[group('dev')]
check:
  nix flake check

# Manually enter dev shell
[group('dev')]
dev:
  nix develop

# Activate the configuration (auto-detects platform and hostname)
[group('Main')]
run:
  #!/usr/bin/env bash
  set -euo pipefail
  host=$(hostname -s)
  if [[ "$(uname)" == "Darwin" ]]; then
    sudo darwin-rebuild switch --flake ".#${host}"
  else
    sudo nixos-rebuild switch --flake ".#${host}"
  fi

# Switch to light theme and rebuild
[group('Theme')]
light:
  printf light > .theme-mode
  just run

# Switch to dark theme and rebuild
[group('Theme')]
dark:
  printf dark > .theme-mode
  just run

# Toggle between light and dark, then rebuild
[group('Theme')]
toggle:
  #!/usr/bin/env bash
  set -euo pipefail
  current=$(cat .theme-mode 2>/dev/null || echo dark)
  current=${current//[[:space:]]/}
  if [ "$current" = "dark" ]; then
    just light
  else
    just dark
  fi
