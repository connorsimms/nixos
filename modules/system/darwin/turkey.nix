{ config, lib, ... }:
{
  options.modules.turkey = {
    enable = lib.mkEnableOption "Cold Turkey Blocker";
  };

  config = lib.mkIf config.modules.turkey.enable {
    homebrew.casks = [ "cold-turkey-blocker" ];
  };
}
