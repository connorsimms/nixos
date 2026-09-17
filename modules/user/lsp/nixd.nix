{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.lsp.nixd = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.lsp.enable;
      description = "Nixd";
    };
  };

  config = lib.mkIf config.modules.lsp.nixd.enable {
    home.packages = [
      pkgs.nixd
    ];
  };
}
