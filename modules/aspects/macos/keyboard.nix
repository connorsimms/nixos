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
          NSGlobalDomain.InitialKeyRepeat = 10;
          NSGlobalDomain.KeyRepeat = 1;
          NSGlobalDomain.ApplePressAndHoldEnabled = false;
        };
      };

      homebrew.casks = [ "karabiner-elements" ];
    };
  };
}
