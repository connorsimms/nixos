{ config, lib, ... }:
{
  options.modules.graphics = {
    enable = lib.mkEnableOption "Graphics support";
  };

  config = lib.mkIf config.modules.graphics.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
