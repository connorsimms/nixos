{ den, __findFile ? __findFile, ... }:
{
  den.aspects.desktop = {
    includes = [ 
      <linux/keyboard> 
      <linux/niri> 
    ];

    nixos =
      { pkgs, ... }:
      {
        # Will eventually organize this
        services.xserver = { 
          videoDrivers = [ "nvidia" ];
        };

        hardware.graphics = {
          enable = true;
          enable32Bit = true;
        };

        hardware.nvidia = {
          open = false;
          modesetting.enable = true;
          powerManagement.enable = false;
          nvidiaSettings = true;
        };

        environment.systemPackages = with pkgs; [ 
          wget 
          curl
        ];
      };
  };
}
