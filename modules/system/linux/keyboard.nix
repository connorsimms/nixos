{ config, lib, ... }:
{
  options.modules.keyboard = {
    enable = lib.mkEnableOption "Keyboard mappings";
  };

  config = lib.mkIf config.modules.keyboard.enable {
    services.xserver.xkb = {
      layout = "us";
      options = "caps:ctrl_modifier,altwin:swap_alt_win";
    };
    console.useXkbConfig = true;
  };
}
