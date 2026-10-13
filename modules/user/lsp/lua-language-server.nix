{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.lsp.lua-language-server = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.lsp.enable;
      description = "Lua language server";
    };
  };

  config = lib.mkIf config.modules.lsp.lua-language-server.enable {
    home.packages = [
      pkgs.lua-language-server
    ];
  };
}
