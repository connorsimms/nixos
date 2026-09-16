{ config, lib, ... }:
{
  options.modules.spotify = {
    enable = lib.mkEnableOption "Spotify";
  };

  config = lib.mkIf config.modules.spotify.enable {
    homebrew.casks = [ "spotify" ];
  };
}
