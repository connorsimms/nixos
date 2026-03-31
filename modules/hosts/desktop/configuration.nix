{ self, inputs, ... }: {
  flake.nixosModules.desktopConfiguration = { pkgs, lib, ... }: {
    imports = [
      self.nixosModules.desktopHardware
      self.nixosModules.core
      self.nixosModules.niri
    ];

    # kernel level stuff, may need to move elsewhere...

    networking.hostName = "desktop";
    system.stateVersion = "25.11";
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

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

    # System Packages
    environment.systemPackages = with pkgs; [
      wget
      curl
      git
      vim
    ];
  };
}




  
