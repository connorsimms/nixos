{ ... }:
{
  home-manager.users.csimms = {
    imports = [ ../../users/csimms.nix ];
  };

  home-manager.backupFileExtension = "backup";

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
