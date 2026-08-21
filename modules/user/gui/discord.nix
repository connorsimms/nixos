{ config, lib, ... }:
{
  options.modules.discord.enable = lib.mkEnableOption "Discord";

  config = lib.mkIf config.modules.discord.enable {
    programs.discord = {
      enable = true;
    };
  };
}
