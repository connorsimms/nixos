{
  config,
  lib,
  inputs,
  ...
}:
{
  imports = [ inputs.zen-browser.homeModules.beta ];

  options.modules.zen.enable = lib.mkEnableOption "Zen browser";

  config = lib.mkIf config.modules.zen.enable {
    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;

      profiles.default = {
        presets.betterfox.enable = true;

        settings = {
          "zen.welcome-screen.seen" = true;
          "zen.workspaces.continue-where-left-off" = true;
          "zen.urlbar.behavior" = "float";
        };

        bookmarks = {
          force = true;
          settings = [
            {
              name = "Toolbar";
              toolbar = true;
              bookmarks = [
                {
                  name = "C++";
                  bookmarks = [
                    {
                      name = "CPP Reference";
                      url = "https://en.cppreference.com/";
                    }
                  ];
                }
              ];
            }
          ];
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
        };
      };
    };
  };
}
