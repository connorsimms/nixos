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

    # Cold Turkey cannot filter a browser without its extension, and a locked
    # block responds to that by blocking the browser outright - which is what
    # made it look like Cold Turkey was "closing" Zen. Force-installing via
    # enterprise policy makes the extension unremovable and independent of
    # extensions.enabledScopes.
    #
    # On macOS the zen flake routes `policies` into the app.zen-browser.zen
    # defaults domain (it sets EnterprisePoliciesEnabled there) rather than into
    # the .app bundle, so this survives activation - home-manager rsyncs the
    # bundle with --delete and would wipe anything written inside it.
    programs.zen-browser.policies.ExtensionSettings = lib.mkIf config.modules.zen.enable {
      "coldturkey@getcoldturkey.com" = {
        installation_mode = "force_installed";
        install_url = "https://getcoldturkey.com/files/Cold_Turkey_Firefox_Addon.xpi";
        private_browsing = true;
      };
    };
  };
}
