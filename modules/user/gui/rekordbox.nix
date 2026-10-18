{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.rekordbox = {
    enable = lib.mkEnableOption "Rekordbox";
  };

  config = lib.mkIf config.modules.rekordbox.enable {
    assertions = [
      {
        assertion = pkgs.stdenv.hostPlatform.isDarwin;
        message = "modules.rekordbox is macOS-only; it installs a Homebrew cask.";
      }
    ];

    modules.darwin.casks = [ "rekordbox" ];
  };
}
