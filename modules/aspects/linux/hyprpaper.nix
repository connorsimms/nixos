{ ... }:
{
  linux.hyprpaper = {
    homeManager = {
      services.hyprpaper = {
        enable = true;
        settings = {
          splash = false;

          preload = [ "/home/csimms/nixos/dotfiles/assets/bg2.jpg" ];

          wallpaper = [
            {
              monitor = "";
              path = "/home/csimms/nixos/dotfiles/assets/bg2.jpg";
            }
          ];
        };
      };
    };
  };
}
