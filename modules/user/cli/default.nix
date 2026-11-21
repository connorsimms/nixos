{ lib, ... }:
{
  imports = [
    ./core.nix
    ./build.nix
    ./claude.nix
    ./git.nix
    ./gh.nix
    ./glab.nix
    ./debug.nix
    ./man.nix
    ./profile.nix
  ];

  options.modules.cli.enable = lib.mkEnableOption "All CLI modules";
}
