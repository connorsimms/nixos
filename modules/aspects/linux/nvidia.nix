{ ... }:
{
  linux.nvidia = {
    nixos = { ... }: {
      hardware.nvidia = {
        modesetting.enable = true;
        open = false;
        nvidiaSettings = true;
        powerManagement.enable = false;
      };

      services.xserver.videoDrivers = [ "nvidia" ];
    };
  };
}
