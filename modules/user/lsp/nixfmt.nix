{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.lsp.nixfmt = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.lsp.enable;
      description = "Nixfmt";
    };
  };

  # A formatter rather than a language server, but it is what nixd is
  # configured to call for formatting (dotfiles/nvim/after/lsp/nixd.lua), and
  # it backs the flake's `formatter` output, so it lives alongside nixd.
  config = lib.mkIf config.modules.lsp.nixfmt.enable {
    home.packages = [
      pkgs.nixfmt
      pkgs.nixfmt-tree
    ];
  };
}
