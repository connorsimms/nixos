{
  config,
  lib,
  inputs,
  ...
}:
{
  imports = [
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  options.modules.homebrew = {
    enable = lib.mkEnableOption "Homebrew";
  };

  config = lib.mkIf config.modules.homebrew.enable {
    nix-homebrew = {
      enable = true;
      user = "csimms";
      autoMigrate = true;
    };

    homebrew = {
      enable = true;
      global.brewfile = true;

      onActivation = {
        autoUpdate = true;
        upgrade = true;
        # "uninstall", not "zap": zap also deletes an app's support files, so
        # any app installed outside nix was destroyed on the next rebuild
        # along with its data. That is what repeatedly removed Cold Turkey's
        # native messaging host and left its extension unable to connect.
        cleanup = "uninstall";
      };
    };
  };
}
