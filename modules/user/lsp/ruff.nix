{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.lsp.ruff = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.lsp.enable;
      description = "Ruff";
    };
  };

  config = lib.mkIf config.modules.lsp.ruff.enable {
    home.packages = [
      pkgs.ruff
    ];
  };
}
