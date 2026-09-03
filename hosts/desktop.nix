{ ... }:
{
  imports = [
    ./desktop/hardware-configuration.nix
    ../modules/bridge
    ../modules/bridge/linux
    ../modules/system
    ../modules/system/linux
  ];

  modules = {
    systemd-boot.enable = true;
    keyboard.enable = true;
    graphics.enable = true;
    nvidia.enable = true;
    perf.enable = true;
    cpupower.enable = true;
    pipewire.enable = true;
    ly.enable = true;
  };

  home-manager.users.csimms.modules = {
    niri.enable = true;
    hyprpaper.enable = true;
    fuzzel.enable = true;
    discord.enable = true;
  };

  networking.networkmanager.enable = true;
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "26.11";
}
