# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "vm-qemu"; # Define your hostname.
  services.qemuGuest.enable = true;
  
  # Qemu
  services.spice-vdagentd.enable = true;

  system.stateVersion = "24.05"; # Did you read the comment?
}
