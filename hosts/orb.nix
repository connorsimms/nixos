{ ... }:
{
  imports = [
    ../modules/bridge
    ../modules/bridge/linux
    ../modules/system
    ../modules/system/linux
  ];

  modules = {
    keyboard.enable = true;
    perf.enable = true;
    cpupower.enable = true;
  };

  home-manager.users.csimms.modules = {
  };

  networking.networkmanager.enable = true;
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "25.11";
}
