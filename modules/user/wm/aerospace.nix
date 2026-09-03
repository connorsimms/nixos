{
  config,
  lib,
  inputs,
  ...
}:
{
  options.modules.aerospace = {
    enable = lib.mkEnableOption "Aerospace WM";
  };

  config = lib.mkIf config.modules.aerospace.enable {
    xdg.configFile."aerospace/aerospace.toml".source =
      inputs.self + "/dotfiles/aerospace/aerospace.toml";
  };
}
