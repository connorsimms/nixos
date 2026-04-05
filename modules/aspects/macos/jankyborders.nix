{ macos, __findFile ? __findFile, ... }:
{
  macos.jankyborders = {
    darwin = { ... }: {
      homebrew.taps = [ "FelixKratz/formulae" ];
      homebrew.brews = [ 
        { 
          name = "felixkratz/formulae/borders";
          restart_service = true;
        } 
      ];
    };

    # Home Manager Configuration
    homeManager = { config, ... }: {
      #"borders/bordersrc".source = 
      #  config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/jankyborders/bordersrc";
    };
  };
}
