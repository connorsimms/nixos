{ linux, __findFile ? __findFile, ... }:
{
  linux.keyboard = {
    nixos = { pkgs, ... }: {
      services.xserver.xkb = {
        layout = "us";
        options = "caps:ctrl_modifier,altwin:swap_alt_win";
      };
      console.useXkbConfig = true;
    };

    homeManager = { config, ... }: {
      # "dir/file.x".source = 
      #   config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/file.x";
    };
  };
}
