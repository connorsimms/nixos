{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.turkey = {
    enable = lib.mkEnableOption "Cold Turkey Blocker";
  };

  config = lib.mkIf config.modules.turkey.enable {
    assertions = [
      {
        assertion = pkgs.stdenv.hostPlatform.isDarwin;
        message = "modules.turkey is macOS-only; it installs a Homebrew cask.";
      }
    ];

    modules.darwin.casks = [ "cold-turkey-blocker" ];
  };
}
