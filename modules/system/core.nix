{ config, pkgs, ... }:

{
  # Nix Core Settings
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Time & Locale
  time.timeZone = "America/Chicago";

  # Networking
  networking.networkmanager.enable = true;

  # System Packages
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    vim
  ];

  # Core User
  users.users.csimms = 
  {
    isNormalUser = true;
    extraGroups = 
    [
      "wheel"
    ];
  };
}
