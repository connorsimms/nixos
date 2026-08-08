{ config, lib, pkgs, inputs, ... }:
{
  options.modules.niri = {
    enable = lib.mkEnableOption "Niri WM";
  };

  config = lib.mkIf config.modules.niri.enable {
    services.mako.enable = true;

    services.udiskie = {
      enable = true;
      automount = true;
      notify = true;
    };

    home.packages = [
      pkgs.xwayland-satellite
    ];

    xdg.configFile."niri/config.kdl".source =
      inputs.self + "/dotfiles/niri/config.kdl";
  };
}
