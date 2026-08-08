{ config, lib, ... }:
{
  options.modules.cpupower = {
    enable = lib.mkEnableOption "cpupower";
  };

  config = lib.mkIf config.modules.cpupower.enable {
    environment.systemPackages = [
      config.boot.kernelPackages.cpupower
    ];
  };
}
