{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.cli.man = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.cli.enable;
      description = "Man pages for home packages";
    };
  };

  config = lib.mkIf config.modules.cli.man.enable {
    programs.man = {
      enable = true;
      generateCaches = pkgs.stdenv.hostPlatform.isLinux;
    };
  };
}
