# Common to Linux & darwin
{pkgs, ...}: {
  imports = [
    ./shared
  ];
  security.pam.services.sudo_local.touchIdAuth = true;
  environment.systemPackages = with pkgs; [
    go
    awscli2
    # posting  # Disabled due to textual build issues with tree_sitter.Query compatibility
    # TODO: Re-enable when textual package is fixed or use alternative Mastodon client
    devenv

    nodejs
    yarn
    node2nix
    bun
  ];
}
