{ config, lib, ... }:
let
  # lib.unique matters: two users (or two modules) asking for the same cask
  # would otherwise emit it twice into the Brewfile.
  requested = lib.unique (
    lib.concatMap (userConfig: userConfig.modules.darwin.casks) (
      lib.attrValues config.home-manager.users
    )
  );
in
{
  config = lib.mkIf (requested != [ ]) {
    homebrew.casks = requested;

    # Asking for a cask on a host that never enabled homebrew would otherwise
    # be a silent no-op. Matches the intra-module idiom used in cli/gh.nix.
    modules.homebrew.enable = lib.mkDefault true;
  };
}
