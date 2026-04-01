{
  # host aspect
  den.aspects.desktop = {
    # host NixOS configuration
    nixos =
      { pkgs, ... }:
      {
        hardware.graphics = {
          enable = true;
          enable32Bit = true;
        };

        services.xserver = { 
          videoDrivers = [ "nvidia" ];
          xkb = {
            layout = "us";
            options = "caps:ctrl_modifier,altwin:swap_alt_win";
          };
        };

        console.useXkbConfig = true;

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

        programs.niri.enable = true;
      };

    # host provides default home environment for its users
    provides.to-users.homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [ 
          vim 
          git 
        ];
      };
  };
}
