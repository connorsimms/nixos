{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.lsp.rust-analyzer = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.lsp.enable;
      description = "Rust analyzer";
    };
  };

  config = lib.mkIf config.modules.lsp.rust-analyzer.enable {
    home.packages = [
      pkgs.rust-analyzer
    ];
  };
}
