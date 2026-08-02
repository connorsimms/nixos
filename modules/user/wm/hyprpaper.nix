{ lib, config, inputs, ... }:
{
  options.modules.hyprpaper = {
    enable = lib.mkEnableOption "Hyprpaper configuration";
  };

  config = lib.mkIf config.modules.hyprpaper.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        splash = false;

        preload = [ "${inputs.self}/dotfiles/assets/5120x1440/bg2.jpg" ];

        wallpaper = [
          {
            monitor = "";
            path = "${inputs.self}/dotfiles/assets/5120x1440/bg2.jpg";
          }
        ];
      };
    };
  };
}
