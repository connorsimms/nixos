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
    homebrew.enable = true;
  };

  home-manager.users.csimms.modules = {
    aerospace.enable = true;
  };

  system.stateVersion = 7;
  system.primaryUser = "csimms";
}
