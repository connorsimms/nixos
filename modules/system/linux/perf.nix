{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.perf = {
    enable = lib.mkEnableOption "Perf";
  };

  config = lib.mkIf config.modules.perf.enable {
    environment.systemPackages = [
      pkgs.perf
    ];
  };
}
