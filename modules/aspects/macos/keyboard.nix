{ macos, __findFile ? __findFile, ... }:
{
  macos.keyboard = {
    darwin = { pkgs, ... }: {
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

    homeManager = { config, ... }: {
      #xdg.configFile."karabiner/karabiner.json".source = 
      #  config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/karabiner.json";
    };
  };
}
