{ self, inputs, ... }:
let
  appName = "drivers";
in
{
  # NixOS Level
  flake.modules.nixos.${appName} = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      
    ];

    # Audio
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };
  
    # Graphics
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  
    # Nvidia (May move this to its own file...)
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia = {
      modesetting.enable = true;
      open = false;
    };

  };

  # DarwinOS Level
  flake.modules.darwin.${appName} = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [

    ];
  };

  # User Level
  flake.modules.homeManager.${appName} = { pkgs, ... }: {
  };
}
