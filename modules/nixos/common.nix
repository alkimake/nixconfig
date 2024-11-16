# Common to Linux & darwin
{pkgs, ...}: {
  imports = [
    ./shared
  ];
  environment.systemPackages = with pkgs; [
    go
  ];
}
