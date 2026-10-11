{ config, lib, ... }:
{
  options.modules.chrome = {
    enable = lib.mkEnableOption "Chrome";
  };

  config = lib.mkIf config.modules.chrome.enable {
    homebrew.casks = [ "google-chrome" ];
  };
}
