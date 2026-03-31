{ config, pkgs, ... }:
{
  imports =
  [
    ./hardware-configuration.nix
    ../../modules/system/core.nix
    ../../modules/system/desktop.nix
  ];

  # match name of directory
  networking.hostName = "desktop"; 

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "25.11";
}
