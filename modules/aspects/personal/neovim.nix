{ personal, inputs, ... }:
{
  personal.neovim = {
    homeManager = { config, pkgs, ... }: {

      programs.neovim = {
        enable = true;
        package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

        withPython3 = false;
        withRuby = false;

        plugins = with pkgs.vimPlugins; [
          nvim-lspconfig
          nvim-treesitter.withAllGrammars
          nvim-treesitter-textobjects

          plenary-nvim
          telescope-nvim
          telescope-fzf-native-nvim
          gruvbox-material
          lualine-nvim
          nvim-web-devicons
          oil-nvim
        ];

        extraPackages = with pkgs; [
          gcc
          gnumake
          fd
          fzf
          ripgrep
          tree-sitter

          # LSP
          nixd
          nixpkgs-fmt
          lua-language-server
          rust-analyzer
          pyright
          clang-tools
        ];
      };

      xdg.configFile."nvim/init.lua" = {
        source = inputs.self + "/dotfiles/nvim/init.lua";
      };

      xdg.configFile."nvim/lua" = {
        source = inputs.self + "/dotfiles/nvim/lua";
        recursive = true;
      };
    };
  };
}
