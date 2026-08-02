{ config, lib, ... }:
{
  options.modules.pipewire = {
    enable = lib.mkEnableOption "Pipewire audio";
  };

  config = lib.mkIf config.modules.pipewire.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    security.rtkit.enable = true;
    services.playerctld.enable = true;
  };
}
