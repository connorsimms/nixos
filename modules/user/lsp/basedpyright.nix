{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.lsp.basedpyright = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.lsp.enable;
      description = "Basedpyright";
    };
  };

  config = lib.mkIf config.modules.lsp.basedpyright.enable {
    home.packages = [
      pkgs.basedpyright
    ];
  };
}
