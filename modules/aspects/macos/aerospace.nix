{ macos, __findFile ? __findFile, ... }:
{
  macos.aerospace = {
    # darwin = { ... }: {
    #   homebrew.taps = [ "nikitabobko/tap" ];
    #   homebrew.casks = [ "aerospace" ];
    # };

    # # Home Manager Configuration
    # homeManager = { config, ... }: {
    #   "aerospace/aerospace.toml".source = 
    #     config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/aerospace.toml";
    # };
  };
}
