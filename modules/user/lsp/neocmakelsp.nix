{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.lsp.neocmakelsp = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.lsp.enable;
      description = "CMake language server";
    };
  };

  config = lib.mkIf config.modules.lsp.neocmakelsp.enable {
    home.packages = [
      pkgs.neocmakelsp
    ];
  };
}
