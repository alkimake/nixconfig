# Common packages for both NixOS and Darwin
# Imported directly (not autowired) to avoid class conflicts
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    go
    awscli2
    devenv

    nodejs
    yarn
    bun
  ];
}
