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

    programs.zen-browser.policies.ExtensionSettings = lib.mkIf config.modules.zen.enable {
      "coldturkey@getcoldturkey.com" = {
        installation_mode = "force_installed";
        install_url = "https://getcoldturkey.com/files/Cold_Turkey_Firefox_Addon.xpi";
        private_browsing = true;
      };
    };
  };
}
