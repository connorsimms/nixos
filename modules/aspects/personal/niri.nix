{ personal, __findFile ? __findFile, ... }:
{
  personal.niri = {
    # NixOS System Configuration
    nixos = { pkgs, ... }: {
      programs.niri.enable = true;
    };

    # Home Manager Configuration
    homeManager = { config, ... }: {
      xdg.configFile."niri/config.kdl".source = 
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/niri/config.kdl";        
    };
  };
}

