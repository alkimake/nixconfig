{flake, config, ...}: let
  # Get the current hostname and use it to determine theme flavor
  hostname = config.networking.hostName or "unknown";
  hostConfig = config.hosts.${hostname} or null;
  
  # Default to mocha if no host-specific config is found
  flavor = if hostConfig != null then hostConfig.theme.flavor else "mocha";
  
  # Map flavor to color scheme
  colorSchemeMap = {
    latte = flake.inputs.nix-colors.colorSchemes.catppuccin-latte;
    frappe = flake.inputs.nix-colors.colorSchemes.catppuccin-frappe;
    macchiato = flake.inputs.nix-colors.colorSchemes.catppuccin-macchiato;
    mocha = flake.inputs.nix-colors.colorSchemes.catppuccin-mocha;
  };
  
  colorScheme = colorSchemeMap.${flavor};
in {
  imports = [
    flake.inputs.nix-colors.homeManagerModules.default
    flake.inputs.catppuccin.homeModules.catppuccin
  ];
  colorScheme = colorScheme;
  catppuccin = {
    inherit flavor;
    bat.enable = true;
    lazygit.enable = true;
    delta.enable = true;
    btop.enable = true;
    fzf.enable = true;
    starship.enable = true;
    zsh-syntax-highlighting.enable = true;
    zed.enable = true;
    yazi.enable = true;
    k9s.enable = true;
    kitty.enable = true;
  };
}
