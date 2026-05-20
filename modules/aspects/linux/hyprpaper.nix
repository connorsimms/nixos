{ ... }:
{
  linux.hyprpaper = {
    homeManager = {
      services.hyprpaper = {
        enable = true;
        settings = {
          splash = false;

          preload = [ "/home/csimms/nixos/dotfiles/assets/5120x1440/bg2.jpg" ];

          wallpaper = [
            {
              monitor = "";
              path = "/home/csimms/nixos/dotfiles/assets/5120x1440/bg2.jpg";
            }
          ];
        };
      };
    };
  };
}
