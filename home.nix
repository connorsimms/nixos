{ config, pkgs, ... }:

{
  home.username = "connor";
  home.homeDirectory = "/home/connor";
  home.stateVersion = "26.05";
  programs.bash = {
    enable = true;
    shellAliases = {
      gs = "git status";
    };
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec uwsm start -S hyprland-uwsm.desktop
      fi
    '';
  };
}
