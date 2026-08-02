{ config, lib, pkgs, ... }:
{
  options.modules.ly = {
    enable = lib.mkEnableOption "Ly display manager";
  };

  config = lib.mkIf config.modules.ly.enable {
    services.displayManager.ly = {
      enable = true;
      package = pkgs.ly;
      settings = {
        animation = "colormix";
        animate = true;
      };
    };
  };
}
