{ ... }:
{
  imports = [
    ./systemd-boot.nix
    ./keyboard.nix
    ./graphics.nix
    ./nvidia.nix
    ./fonts.nix
    ./perf.nix
    ./cpupower.nix
    ./pipewire.nix
    ./ly.nix
  ];

  users = {
    mutableUsers = true;

    users.csimms = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
      initialPassword = "password";
    };
  };
}
