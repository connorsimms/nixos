{ lib, ... }:
{
  imports = [
    ./core.nix
    ./claude.nix
    ./git.nix
    ./gh.nix
    ./glab.nix
    ./debug.nix
    ./nixfmt.nix
    ./profile.nix
  ];

  options.modules.cli.enable = lib.mkEnableOption "All CLI modules";
}
