{ config, lib, ... }:
{
  options.modules.perf = {
    enable = lib.mkEnableOption "Perf";
  };

  config = lib.mkIf config.modules.perf.enable {
    environment.systemPackages = [
      config.boot.kernelPackages.perf
    ];
  };
}
