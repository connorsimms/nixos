{ lib, ... }:
{
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
