{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.lsp.gersemi = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.lsp.enable;
      description = "Gersemi";
    };
  };

  # A formatter rather than a language server. dotfiles/nvim/lua/lsp.lua runs it
  # on save for CMake files in projects that carry a .gersemirc.
  config = lib.mkIf config.modules.lsp.gersemi.enable {
    home.packages = [
      pkgs.gersemi
    ];
  };
}
