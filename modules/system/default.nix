{ ... }:
{
  home-manager.backupFileExtension = "backup";
  home-manager.useGlobalPkgs = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
