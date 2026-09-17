{
  config,
  lib,
  pkgs,
  ...
}:
let
  aerospaceUsers = lib.filterAttrs (
    name: userConfig: userConfig.modules.aerospace.enable or false
  ) config.home-manager.users;
in
{
  config = lib.mkIf (aerospaceUsers != { }) {
    services.aerospace = {
      enable = true;
      package = pkgs.aerospace;
    };
  };
}
