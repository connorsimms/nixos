{ modulesPath, ... }:
{
  imports = [
    "${modulesPath}/virtualisation/lxc-container.nix"
    ../modules/bridge
    ../modules/bridge/linux
    ../modules/system
    ../modules/system/linux
  ];

  modules = {
    orbstack = {
      enable = true;
      caCertificate = builtins.readFile ./orb/orbstack-ca.pem;
    };
    docs.enable = true;
  };

  home-manager.users.csimms = {
    imports = [ ../profiles/base.nix ];
    home.stateVersion = "26.11";
  };

  networking.hostName = "nixos";
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "25.11";
}
