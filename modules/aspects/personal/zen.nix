{ personal, inputs, __findFile ? __findFile, ... }:
{
  personal.zen = {
    homeManager = { config, pkgs, ... }: {
      imports = [ inputs.zen-browser.homeModules.beta ];

      programs.zen-browser = {
        enable = true;
        setAsDefaultBrowser = true;

        policies = 
          let
            mkPluginUrl = id: "https://addons.mozilla.org/firefox/downloads/latest/${id}/latest.xpi";

            mkExtensionEntry = {
              id,
              pinned ? false,
            }: let
              base = {
                install_url = mkPluginUrl id;
                installation_mode = "force_installed";
              };
            in
              if pinned
              then base // {default_area = "navbar";}
              else base;

            mkExtensionSettings = builtins.mapAttrs (_: entry:
              if builtins.isAttrs entry
              then entry
              else mkExtensionEntry {id = entry;});
        in {
          ExtensionSettings = mkExtensionSettings {
            "uBlock0@raymondhill.net" = mkExtensionEntry {
              id = "ublock-origin";
              pinned = true;
            };
          };
          DisableAppUpdate = true;
          DisableFeedbackCommands = true;
          DisableFirefoxStudies = true;
          DisablePocket = true;
          DisableTelemetry = true;
          DontCheckDefaultBrowser = true;
          NoDefaultBookmarks = true;
          EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
          };
        };

        profiles.default = {
          settings = {
            "zen.workspaces.continue-where-left-off" = true;
            "zen.urlbar.behavior" = "float";
            "zen.welcome-screen.seen" = true;
          };

          spacesForce = true;
          spaces = {
            "𝛼" = {
              id = "alpha_workspace";
              icon = "𝛼";
              position = 1000;
            };
            "𝛽" = {
              id = "beta_workspace";
              icon = "𝛽";
              position = 2000;
            };
            "𝛾" = {
              id = "gamma_workspace";
              icon = "𝛾";
              position = 3000;
            };
          };

          pinsForce = true;
          pinsForceAction = "remove";
          pins = {
            "GitHub" = {
              id = "github_pin";
              url = "https://github.com/connorsimms";
              isEssential = true;
              position = 100;
            };
            "Google Mail" = {
              id = "googlemail_pin";
              url = "https://mail.google.com";
              isEssential = true;
              position = 201;
            };
            "Outlook Mail" = {
              id = "outlook_pin";
              url = "https://outlook.office.com/mail";
              isEssential = true;
              position = 202;
            };
            "Google Calendar" = {
              id = "googlecalendar_pin";
              url = "https://calendar.google.com";
              isEssential = true;
              position = 301;
            };
            "Canvas" = {
              id = "canvas_pin";
              url = "https://canvas.wisc.edu";
              isEssential = true;
              position = 302;
            };
          };
        };
      };
    };
  };
}

