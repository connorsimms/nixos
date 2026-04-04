{ macos, __findFile ? __findFile, ... }:
{
  macos.jankyborders = {
    darwin = { ... }: {
      homebrew.taps = [ "FelixKratz/formulae" ];
      homebrew.brews = [ "borders" ];
    };

    # Home Manager Configuration
    homeManager = { config, ... }: {
      #"borders/bordersrc".source = 
      #  config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/jankyborders/bordersrc";
    };
  };
}
