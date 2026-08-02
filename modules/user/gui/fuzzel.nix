{ lib, config, ... }:
{
  options.modules.fuzzel = {
    enable = lib.mkEnableOption "Fuzzel launcher";
  };

  config = lib.mkIf config.modules.fuzzel.enable {
    programs.fuzzel = {
      enable = true;
    };
  };
}
