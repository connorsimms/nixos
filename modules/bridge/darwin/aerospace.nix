{ config, lib, ... }:
let
  aerospaceUsers = lib.filterAttrs (name: userConfig: userConfig.modules.aerospace.enable or false) config.home-manager.users;
in
{
  config = lib.mkIf (aerospaceUsers != { }) {
    homebrew.taps = [ "nikitabobko/tap" ];
    homebrew.casks = [ "nikitabobko/tap/aerospace" ];
  };
}
