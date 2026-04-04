{ personal, inputs, ... }:
{
  personal.editors = {
    homeManager = { config, pkgs, ... }: {

      programs.neovim = {
        enable = true;
	      package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

        plugins = with pkgs.vimPlugins; [
          nvim-lspconfig
          (nvim-treesitter.withPlugins (p: [
            p.markdown
            p.markdown_inline
            p.vim
            p.toml
            p.bash
            p.c
            p.cpp
            p.python
            p.lua
            p.html
            p.css
            p.nix
            p.latex
          ]))
          nvim-treesitter-textobjects

          plenary-nvim
          telescope-nvim
          telescope-fzf-native-nvim
          gruvbox-material
          lualine-nvim
          nvim-web-devicons
        ];
        
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
          clang-tools
        ];
      };

      home.packages = with pkgs; [
        vim
      ];

      xdg.configFile."vim" = {
        #source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/vim";
        source = ../../../dotfiles/vim;
      };

      xdg.configFile."nvim/init.lua" = {
        #source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/nvim";
        source = ./nvim/init.lua;
      };

      xdg.configFile."nvim/lua" = {
        #source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/nvim";
        source = ./nvim/lua;
        recursive = true;
      };
    };
  };
}
