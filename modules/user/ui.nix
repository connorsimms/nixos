{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    rofi
    dunst
    cliphist
    hyprpaper
  ];

  programs.bash.profileExtra = ''
    if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
      exec Hyprland
    fi
  '';

  programs.firefox = {
    enable = true;
  };
}
