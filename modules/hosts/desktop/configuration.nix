{ self, inputs, ... }: {
  flake.modules.nixos.desktopConfiguration = { pkgs, lib, ... }: {
    imports = [
      self.modules.nixos.desktopHardware
      self.modules.nixos.core
      self.modules.nixos.niri
    ];

    home-manager.users.csimms = {
      imports = [
        self.modules.homeManager.core
        self.modules.homeManager.cli
        self.modules.homeManager.niri
        self.modules.homeManager.firefox
      ];
    };

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




  
