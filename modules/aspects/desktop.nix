{ den, __findFile ? __findFile, ... }:
{
  # host aspect
  den.aspects.desktop = {
    includes = [
      <personal/niri>
    ];

    # host NixOS configuration
    nixos =
      { pkgs, ... }:
      {
        services.xserver = { 
          videoDrivers = [ "nvidia" ];
          xkb = {
            layout = "us";
            options = "caps:ctrl_modifier,altwin:swap_alt_win";
          };
        };

        console.useXkbConfig = true;

        hardware.graphics = {
          enable = true;
          enable32Bit = true;
        };

        hardware.nvidia = {
          open = false;
          modesetting.enable = true;
          powerManagement.enable = false;
          nvidiaSettings = true;
          # package = config.boot.kernelPackages.nvidiaPackages.stable;
        };

        environment.systemPackages = with pkgs; [ 
          wget 
          curl
        ];
      };
  };
}
