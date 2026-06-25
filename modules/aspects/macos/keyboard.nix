{ ... }:
{
  macos.keyboard = {
    darwin = { ... }: {
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

      homebrew.casks = [ "karabiner-elements" ];
    };
  };
}
