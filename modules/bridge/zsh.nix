{
  config,
  lib,
  pkgs,
  ...
}:
let
  zshUsers = lib.filterAttrs (
    name: userConfig: userConfig.modules.zsh.enable or false
  ) config.home-manager.users;
in
{
  config = lib.mkIf (zshUsers != { }) {
    programs.zsh.enable = true;

    users.users = lib.mapAttrs (name: _: {
      shell = pkgs.zsh;
    }) zshUsers;
  };
}
