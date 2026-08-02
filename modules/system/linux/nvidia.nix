{ config, lib, ... }:
{
  options.modules.nvidia = {
    enable = lib.mkEnableOption "Nvidia support";
  };

  config = lib.mkIf config.modules.nvidia.enable {
    hardware.nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      powerManagement.enable = false;

      package = config.boot.kernelPackages.nvidiaPackages.production;
    };
    services.xserver.videoDrivers = [ "nvidia" ];
  };
}
