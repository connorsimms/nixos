{ config, lib, ... }:
{
  options.modules.anki = {
    enable = lib.mkEnableOption "Anki";
  };

  config = lib.mkIf config.modules.anki.enable {
    homebrew.casks = [ "anki" ];
  };
}
