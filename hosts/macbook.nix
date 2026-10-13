{ ... }:
{
  imports = [
    ../modules/bridge
    ../modules/bridge/darwin
    ../modules/system
    ../modules/system/darwin
  ];

  modules = {
    keyboard.enable = true;
    fonts.enable = true;
    homebrew.enable = true;
    orbstack.enable = true;
  };

  home-manager.users.csimms = {
    imports = [ ../profiles/extra.nix ];
    home.stateVersion = "26.11";
    modules = {
      aerospace.enable = true;

      # Applications are chosen in the user tree, on either platform; the
      # Homebrew casks these need are collected by modules/bridge/darwin.
      anki.enable = true;
      chrome.enable = true;
      spotify.enable = true;
      turkey.enable = true;
    };
  };

  nix.enable = false;

  system = {
    stateVersion = 7;
    primaryUser = "csimms";
    defaults.dock.persistent-apps = [
      { app = "/System/Applications/System Settings.app"; }
      { app = "/Users/csimms/Applications/Home Manager Apps/kitty.app"; }
      { app = "/Users/csimms/Applications/Home Manager Apps/sioyek.app"; }
      { app = "/Users/csimms/Applications/Home Manager Apps/Zen Browser (Beta).app"; }
    ];
  };
}
