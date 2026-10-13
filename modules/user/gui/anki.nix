{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.anki = {
    enable = lib.mkEnableOption "Anki";
  };

  config = lib.mkIf config.modules.anki.enable {
    assertions = [
      {
        assertion = pkgs.stdenv.hostPlatform.isDarwin;
        message = "modules.anki is macOS-only; it installs a Homebrew cask.";
      }
    ];

    modules.darwin.casks = [ "anki" ];
  };
}
