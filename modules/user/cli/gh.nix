{ config, lib, ... }:
{
  options.modules.cli.gh = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.cli.enable;
      description = "GitHub";
    };
  };

  config = lib.mkIf config.modules.cli.gh.enable {
    modules.cli.git.enable = lib.mkDefault true;

    programs.gh = {
      enable = true;
    };
  };
}
