{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.spotify = {
    enable = lib.mkEnableOption "Spotify";
  };

  config = lib.mkIf config.modules.spotify.enable {
    assertions = [
      {
        assertion = pkgs.stdenv.hostPlatform.isDarwin;
        message = "modules.spotify is macOS-only; it installs a Homebrew cask.";
      }
    ];

    modules.darwin.casks = [ "spotify" ];
  };
}
