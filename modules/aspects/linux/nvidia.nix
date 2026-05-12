{ ... }:
{
  linux.nvidia = {
    nixos = { config, ... }: {
      hardware.nvidia = {
        modesetting.enable = true;
        open = false;
        nvidiaSettings = true;
        powerManagement.enable = false;

        package = config.boot.kernelPackages.nvidiaPackages.production;
      };

      services.xserver.videoDrivers = [ "nvidia" ];
    };
  };
}
