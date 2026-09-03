{ config, lib, ... }:
{
  options.modules.orbstack = {
    enable = lib.mkEnableOption "Orbstack";
  };

  config = lib.mkIf config.modules.orbstack.enable {
    homebrew.casks = [ "orbstack" ];
  };
}
