{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.cli.claude = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.cli.enable;
      description = "Claude Code";
    };
  };

  config = lib.mkIf config.modules.cli.claude.enable {
    home.packages = [
      pkgs.claude-code
    ];
  };
}
