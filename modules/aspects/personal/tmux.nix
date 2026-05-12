{ ... }:
{
  personal.tmux = {
    homeManager = { config, pkgs, ... }: {
      home.packages = with pkgs; [ tmux ];

      xdg.configFile."tmux/tmux.conf".source =
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/tmux/tmux.conf";
    };
  };
}
