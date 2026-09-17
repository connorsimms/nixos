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
        NSGlobalDomain.InitialKeyRepeat = 15;
        NSGlobalDomain.KeyRepeat = 2;
        NSGlobalDomain.ApplePressAndHoldEnabled = false;
        CustomUserPreferences = {
          "com.apple.symbolichotkeys" = {
            AppleSymbolicHotKeys = {
              # Remap Cmd + Opt + Shift + 3
              "28" = {
                enabled = true;
                value = {
                  parameters = [
                    51
                    20
                    1703936
                  ];
                  type = "standard";
                };
              };
              # Remap Cmd + Opt + Shift + 4
              "30" = {
                enabled = true;
                value = {
                  parameters = [
                    52
                    21
                    1703936
                  ];
                  type = "standard";
                };
              };
              # Remap Cmd + Opt + Shift + 5
              "184" = {
                enabled = true;
                value = {
                  parameters = [
                    53
                    23
                    1703936
                  ];
                  type = "standard";
                };
              };
            };
          };
        };
      };
    };
  };
}
