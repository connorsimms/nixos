{ ... }:
{
  linux.niri = {
    nixos = { pkgs, ... }: {
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

    homeManager = { config, pkgs, ... }: {
      services.mako = {
        enable = true;
      };

      services.udiskie = {
        enable = true;
        automount = true;
        notify = true;
      };

      home.packages = with pkgs; [
        xwayland-satellite
      ];

      xdg.configFile."niri/config.kdl".source =
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/niri/config.kdl";
    };
  };
}

