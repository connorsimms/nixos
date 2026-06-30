{ ... }:
{
  linux.containers = {
    nixos = { pkgs, ... }: {
      virtualisation.podman = {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };
    };

    homeManager = { config, pkgs, ... }: {
      home.packages = with pkgs; [
        distrobox
      ];
    };
  };
}
