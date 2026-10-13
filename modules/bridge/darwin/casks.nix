{ config, lib, ... }:
let
  requested = lib.unique (
    lib.concatMap (userConfig: userConfig.modules.darwin.casks) (
      lib.attrValues config.home-manager.users
    )
  );
in
{
  config = lib.mkIf (requested != [ ]) {
    homebrew.casks = requested;

    modules.homebrew.enable = lib.mkDefault true;
  };
}
