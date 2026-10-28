{ lib, ... }:
{
  imports = [
    ./systemd-boot.nix
    ./keyboard.nix
    ./graphics.nix
    ./nvidia.nix
    ./perf.nix
    ./cpupower.nix
    ./pipewire.nix
    ./ly.nix
    ./docs.nix
    ./orbstack.nix
  ];

  users = {
    mutableUsers = lib.mkDefault true;

    users.csimms = {
      isNormalUser = lib.mkDefault true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
      initialPassword = "password";
    };
  };
}
