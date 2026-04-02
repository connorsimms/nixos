{ personal, __findFile ? __findFile, ... }:
{
  personal.editors = {
    homeManager = { config, pkgs, ... }: {
      
      # Vim (No Dependency Config)
      programs.vim = {
        enable = true;
        # defaultEditor = false;
      };

      home.file.".vimrc".source = 
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/vim/vimrc";

      # Neovim
      programs.neovim = {
        enable = true;
        # defaultEditor = true;

        extraPackages = with pkgs; [
          ripgrep   # Telescope fuzzy finding
          fd        # Telescope file finding
          gcc       # Compiling Treesitter parsers
          xclip     # System clipboard support on Linux
          wl-clipboard # System clipboard support on Wayland
        ];
      };

      xdg.configFile."nvim".source = 
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/nvim";
    };
  };
}
