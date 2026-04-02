{ personal, __findFile ? __findFile, ... }:
{
  personal.editors = {
    homeManager = { config, pkgs, ... }: {

      home.packages = with pkgs; [
        vim
        neovim
        ripgrep
        fd
        fzf
        rust-analyzer
      ];
      
      home.file.".vimrc".source = 
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/vim/vimrc";

      xdg.configFile."nvim".source = 
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/nvim";
    };
  };
}
