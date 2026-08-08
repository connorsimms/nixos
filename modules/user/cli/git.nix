{ config, lib, ... }:
{
  options.modules.cli.git = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.cli.enable;
      description = "Git";
    };
  };

  config = lib.mkIf config.modules.cli.git.enable {
    programs.git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        core.editor = "vim";
      };
      aliases = {
        st = "status";
        sw = "switch";
        co = "checkout";
      };
    };
  };
}
