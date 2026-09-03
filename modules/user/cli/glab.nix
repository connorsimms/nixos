{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.cli.glab = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.cli.enable;
      description = "GitLab CLI";
    };
  };

  config = lib.mkIf config.modules.cli.glab.enable {
    modules.cli.git.enable = lib.mkDefault true;

    home.packages = [
      pkgs.glab
    ];
  };
}
