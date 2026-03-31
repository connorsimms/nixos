{ self, inputs, ... }: {
  flake.modules.nixos.desktopConfiguration = { pkgs, lib, ... }: {
    imports = [
      self.modules.nixos.desktopHardware

      self.modules.nixos.nix
      self.modules.nixos.user

      self.modules.nixos.base

      self.modules.nixos.niri
      self.modules.nixos.drivers
    ];

    home-manager.users.csimms = {
      imports = [
        self.modules.homeManager.nix
        self.modules.homeManager.user

        self.modules.homeManager.base

        self.modules.homeManager.cli
        self.modules.homeManager.niri
        self.modules.homeManager.firefox
      ];
    };

    # Machine Details
    networking.hostName = "desktop";
    system.stateVersion = "25.11";

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}




  
