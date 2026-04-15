{
  flake,
  pkgs,
  lib,
  hosts ? {},
  hostname ? "",
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
  inherit (pkgs.stdenv) isDarwin;

  # Resolve active catppuccin flavour from .theme-mode + per-host light/dark.
  modeRaw = builtins.readFile ../../.theme-mode;
  mode = builtins.replaceStrings ["\n" " " "\t"] ["" "" ""] modeRaw;
  hostConfig = hosts.${hostname} or null;
  lightFlavor = if hostConfig != null then hostConfig.theme.lightFlavor else "latte";
  darkFlavor  = if hostConfig != null then hostConfig.theme.darkFlavor  else "mocha";
  flavour = if mode == "light" then lightFlavor else darkFlavor;

  nixvim' = inputs.nixvim.packages.${pkgs.stdenv.hostPlatform.system}.default;
  nvim = nixvim'.extend {
    plugins.avante.settings = {
      claude = {
        endpoint = "https://api.anthropic.com";
        max_tokens = 4096;
        model = "claude-3-5-sonnet-20241022";
        temperature = 0;
      };
      provider = lib.mkForce "claude";
    };
    plugins.lsp.servers.ansiblels.enable = lib.mkForce false;
    # nixpkgs removed `nodePackages`; disable prettier source until nixvim updates.
    plugins.none-ls.sources.formatting.prettier.enable = lib.mkForce false;
    # Follow the repo-wide light/dark mode.
    colorschemes.catppuccin.settings.flavour = lib.mkForce flavour;
  };
  # systemBaseHomeModules = (
  #   if isDarwin
  #   then self.homeModules.darwin
  #   else self.homeModules.nixos
  # );
in {
  home.packages = [
    nvim
  ];
  imports = [
    self.homeModules.default
  ];
  home.username = "ake";
  home.homeDirectory = lib.mkDefault "/${
    if isDarwin
    then "Users"
    else "home"
  }/ake";
  home.stateVersion = "22.11";
}
