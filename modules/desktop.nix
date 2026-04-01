{
  # host aspect
  den.aspects.desktop = {
    # host NixOS configuration
    nixos =
      { pkgs, ... }:
      {
        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        fileSystems."/" =
          { device = "/dev/disk/by-uuid/00922f2b-037a-40bf-9229-61607070e66c";
            fsType = "ext4";
          };

        fileSystems."/boot" =
          { device = "/dev/disk/by-uuid/2BCB-568F";
            fsType = "vfat";
            options = [ "fmask=0022" "dmask=0022" ];
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
