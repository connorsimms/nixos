{ config, lib, ... }:
{
  options.modules.systemd-boot = {
    enable = lib.mkEnableOption "Systemd bootloader";
  };

  config = lib.mkIf config.modules.systemd-boot.enable {
    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
