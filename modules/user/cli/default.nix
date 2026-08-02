{ lib, ... }:
{
  imports = [
    ./core.nix
    ./git.nix
    ./gh.nix
    ./debug.nix
    ./profile.nix
  ];

  options.modules.cli.enable = lib.mkEnableOption "All CLI modules";
}
