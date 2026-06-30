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
          # Dependencies
          plenary-nvim
          nvim-web-devicons

          # Navigation
          oil-nvim
          telescope-nvim
          telescope-fzf-native-nvim

          # Treesitter
          nvim-treesitter.withAllGrammars
          nvim-treesitter-textobjects

          # LSP
          nvim-lspconfig

          # Snippets & Completion
          nvim-cmp
          cmp-nvim-lsp
          cmp-buffer
          cmp-path
          luasnip
          cmp_luasnip
          friendly-snippets

          # Theme
          gruvbox-material
          melange-nvim
          lualine-nvim
        ];

        extraPackages = with pkgs; [
          # Build
          gcc
          gnumake
          tree-sitter

          # Search
          fd
          fzf
          ripgrep

          # LSP & Formatting
          clang-tools

          jdk21
          jdt-language-server

          lua-language-server

          nixd
          nixpkgs-fmt

          pyright
          ruff

          rust-analyzer
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
