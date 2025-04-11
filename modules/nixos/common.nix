# Common to Linux & darwin
{pkgs, ...}: {
  imports = [
    ./shared
  ];
  security.pam.services.sudo_local.touchIdAuth = true;
  environment.systemPackages = with pkgs; [
    go
    awscli2
    posting
    devenv
  ];
}
