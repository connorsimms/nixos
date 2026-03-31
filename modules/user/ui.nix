{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    rofi
    dunst
    cliphist
    hyprpaper
  ];

  home.file.".config/uwsm/env".text = ''
    export LIBVA_DRIVER_NAME=nvidia
    export XDG_SESSION_TYPE=wayland
    export GBM_BACKEND=nvidia-drm
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export NIXOS_OZONE_WL=1
  '';

  programs.bash.profileExtra = ''
    if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
      exec uwsm start hyprland-uwsm.desktop
    fi
  '';
}
