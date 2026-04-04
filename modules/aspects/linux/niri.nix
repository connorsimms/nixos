{ linux, __findFile ? __findFile, ... }:
{
  linux.niri = {
    nixos = { pkgs, ... }: {
      programs.niri.enable = true;
    };

    homeManager = { config, ... }: {
      xdg.configFile."niri/config.kdl".source = 
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/niri/config.kdl";        
    };
  };
}

