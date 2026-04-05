{ macos, inputs, __findFile ? __findFile, ... }:
{
  macos.aerospace = {
    darwin = { ... }: {
      homebrew.taps = [ "nikitabobko/tap" ];
      homebrew.casks = [ "nikitabobko/tap/aerospace" ];
    };

    # Home Manager Configuration
    homeManager = { config, ... }: {
      xdg.configFile."aerospace/aerospace.toml".source = config.lib.file.mkOutOfStoreSymlink 
        "${config.home.homeDirectory}/nixos/dotfiles/aerospace/aerospace.toml";
    };
  };
}
