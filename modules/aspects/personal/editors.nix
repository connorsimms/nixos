{ personal, ... }:
{
  personal.editors = {
    homeManager = { config, pkgs, ... }: {

      programs.neovim = {
        enable = true;
        
        extraPackages = with pkgs; [
          gcc 
          gnumake
          fd 
          fzf 
          ripgrep
          tree-sitter

          # LSP
          nil 
          nixpkgs-fmt
          lua-language-server 
          rust-analyzer 
          pyright
        ];
      };

      home.packages = with pkgs; [
        vim
      ];

      xdg.configFile."vim".source = 
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/vim";
      xdg.configFile."nvim".source = 
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/nvim";
    };
  };
}
