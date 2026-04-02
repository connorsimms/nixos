{ inputs, ... }:
{
  den.aspects.desktop.nixos = { config, lib, pkgs, ... }: {
    imports = [ 
        "${inputs.nixpkgs}/nixos/modules/installer/scan/not-detected.nix"
      ];

    boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
      { device = "/dev/disk/by-uuid/00922f2b-037a-40bf-9229-61607070e66c";
        fsType = "ext4";
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/2BCB-568F";
        fsType = "vfat";
        options = [ "fmask=0022" "dmask=0022" ];
      };

    swapDevices = [ ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
