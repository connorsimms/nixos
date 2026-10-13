{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.chrome = {
    enable = lib.mkEnableOption "Google Chrome";
  };

  config = lib.mkIf config.modules.chrome.enable {
    assertions = [
      {
        assertion = pkgs.stdenv.hostPlatform.isDarwin;
        message = "modules.chrome is macOS-only; it installs a Homebrew cask.";
      }
    ];

    modules.darwin.casks = [ "google-chrome" ];
  };
}
