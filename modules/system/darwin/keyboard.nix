{ config, lib, ... }:
{
  options.modules.keyboard = {
    enable = lib.mkEnableOption "Keyboard mappings";
  };

  config = lib.mkIf config.modules.keyboard.enable {
    system = {
      keyboard = {
        enableKeyMapping = true;
        remapCapsLockToControl = true;
      };
      defaults = {
        NSGlobalDomain.InitialKeyRepeat = 25;
        NSGlobalDomain.KeyRepeat = 5;
        NSGlobalDomain.ApplePressAndHoldEnabled = false;
      };
    };
  };
}
