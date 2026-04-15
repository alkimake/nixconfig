# Common to Darwin
{pkgs, ...}: {
  imports = [
    ../nixos/shared
  ];
  
  # macOS-specific settings
  security.pam.services.sudo_local.touchIdAuth = true;
  
  environment.systemPackages = with pkgs; [
    go
    awscli2
    posting
    devenv
  ];
} 