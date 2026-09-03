{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.cli.nixfmt = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.cli.enable;
      description = "Nixfmt";
    };
  };

  config = lib.mkIf config.modules.cli.nixfmt.enable {
    home.packages = [
      pkgs.nixfmt
      pkgs.nixfmt-tree
    ];
  };
}
