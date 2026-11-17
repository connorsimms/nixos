{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.openscreen = {
    enable = lib.mkEnableOption "OpenScreen";
  };

  config = lib.mkIf config.modules.openscreen.enable {
    assertions = [
      {
        assertion = pkgs.stdenv.hostPlatform.isDarwin;
        message = "modules.openscreen is macOS-only; it installs a Homebrew cask.";
      }
    ];

    modules.darwin.casks = [ "openscreen" ];
  };
}
