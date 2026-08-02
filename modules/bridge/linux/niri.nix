{ config, lib, pkgs, ... }:
let
  niriUsers = lib.filterAttrs (name: userConfig: userConfig.modules.niri.enable or false) config.home-manager.users;
in
{
  config = lib.mkIf (niriUsers != { }) {

    programs.niri.enable = true;
    security.rtkit.enable = true;
    security.polkit.enable = true;
    services.udisks2.enable = true;
    programs.xwayland.enable = true;

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      wlr.enable = true;
      config.common.default = "*";
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };
}
