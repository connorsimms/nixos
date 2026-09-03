{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.neovim = {
    enable = lib.mkEnableOption "Neovim configuration";
  };

  config = lib.mkIf config.modules.neovim.enable {
    modules.vim.enable = lib.mkDefault true;
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      plugins = [
        # Dependencies
        pkgs.vimPlugins.plenary-nvim
        pkgs.vimPlugins.nvim-web-devicons

        # Navigation
        pkgs.vimPlugins.oil-nvim
        pkgs.vimPlugins.telescope-nvim
        pkgs.vimPlugins.telescope-fzf-native-nvim

        # Treesitter
        pkgs.vimPlugins.nvim-treesitter.withAllGrammars
        pkgs.vimPlugins.nvim-treesitter-textobjects

        # LSP
        pkgs.vimPlugins.nvim-lspconfig

        # Snippets & Completion
        pkgs.vimPlugins.nvim-cmp
        pkgs.vimPlugins.cmp-nvim-lsp
        pkgs.vimPlugins.cmp-buffer
        pkgs.vimPlugins.cmp-path
        pkgs.vimPlugins.luasnip
        pkgs.vimPlugins.cmp_luasnip
        pkgs.vimPlugins.friendly-snippets

        # Appearance
        pkgs.vimPlugins.gruvbox-material
        pkgs.vimPlugins.melange-nvim
        pkgs.vimPlugins.lualine-nvim
      ];

      # Dependencies for plugins
      extraPackages = [
        # Navigation
        pkgs.fd
        pkgs.fzf
        pkgs.ripgrep

        # Treesitter
        pkgs.tree-sitter
        pkgs.curl
        pkgs.gcc
      ];
    };

    xdg.configFile."nvim/init.lua" = {
      source = inputs.self + "/dotfiles/nvim/init.lua";
    };

    xdg.configFile."nvim/lua" = {
      source = inputs.self + "/dotfiles/nvim/lua";
      recursive = true;
    };

    xdg.configFile."nvim/after/lsp" = {
      source = inputs.self + "/dotfiles/nvim/after/lsp";
      recursive = true;
    };
  };
}
