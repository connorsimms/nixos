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

  config = lib.mkIf config.modules.lsp.nixfmt.enable {
    home.packages = [
      pkgs.nixfmt
      pkgs.nixfmt-tree
    ];
  };
}
