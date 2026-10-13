{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.fonts = {
    enable = lib.mkEnableOption "Better fonts";
  };

  config = lib.mkIf config.modules.fonts.enable {
    fonts.packages = [
      pkgs.nerd-fonts.jetbrains-mono
    ];
  };
}
