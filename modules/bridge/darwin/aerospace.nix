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

    # nix-darwin always passes --config-path pointing at a TOML generated from
    # services.aerospace.settings, which would shadow the home-manager managed
    # ~/.config/aerospace/aerospace.toml. Launch without it so the dotfile wins.
    launchd.user.agents.aerospace.command = lib.mkForce "${config.services.aerospace.package}/Applications/AeroSpace.app/Contents/MacOS/AeroSpace";
  };
}
