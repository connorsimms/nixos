{ personal, __findFile ? __findFile, ... }:
{
  personal.editors = {
    homeManager = { config, pkgs, ... }: {
      
      # Vim
      programs.vim = {
        enable = true;
        defaultEditor = false;
      };

      # Neovim
      programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
      };

      xdg.configFile."nvim".source = 
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/nvim";

    };
  };
}
