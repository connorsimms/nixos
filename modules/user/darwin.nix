{ lib, ... }:
{
  # The request channel for darwin-only system resources a user module needs.
  # A home-manager module cannot write `homebrew.casks` itself - that is a
  # system option - so GUI app modules append here and
  # modules/bridge/darwin/casks.nix collects the result. This keeps the
  # collector independent of the app list: adding an app means adding one file
  # under modules/user/gui/, with nothing else to wire up.
  options.modules.darwin.casks = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    example = [ "anki" ];
    description = ''
      Homebrew casks this user wants installed. Collected into the system's
      `homebrew.casks` by modules/bridge/darwin/casks.nix, which a darwin host
      gets by importing modules/bridge/darwin.
    '';
  };
}
