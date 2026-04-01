{ self, inputs, ... }:

{
  # OS Level
  flake.modules.nixos.niri = { pkgs, ... }: {
    programs.niri = {
      enable = true;
    };
  };

  # User Level 
  flake.modules.homeManager.niri = { pkgs, ... }: {
    programs.niri = {
      enable = true;

      settings = {
        prefer-no-csd = true;

        spawn-at-startup = [
	  lib.getExe pkgs.noctalia-shell
        ];

        input = {
          keyboard = {
            xkb = {
              layout = "us";
              options = "ctrl:nocaps,altwin:swap_alt_win";
            };

            repeat-delay = 300;
            repeat-rate = 20;
          };
        };

        # run 'niri msg outputs'
        outputs."HDMI-A-1" = {
          mode = "5120x1440@240.000";
          scale = 1.0;
        };

        binds = {
          # Launchers 
          "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;
          "Mod+D".spawn-sh = lib.getExe pkgs.rofi;
          "Mod+B".spawn-sh = lib.getExe pkgs.rofi;

          # Visibility
          "Mod+Q".close-window = _:{};
          "Mod+C".center-column = _:{};
          "Mod+F".maximize-column = _:{};

          # Focus
          "Mod+H".focus-column-left = _:{};
          "Mod+J".focus-window-down = _:{};
          "Mod+K".focus-window-up = _:{};
          "Mod+L".focus-column-right = _:{};

          "Mod+1".focus-workspace = 1;
          "Mod+2".focus-workspace = 2;
          "Mod+3".focus-workspace = 3;
          "Mod+4".focus-workspace = 4;
          "Mod+5".focus-workspace = 5;

          "Mod+Shift+1".move-column-to-workspace = 1;
          "Mod+Shift+2".move-column-to-workspace = 2;
          "Mod+Shift+3".move-column-to-workspace = 3;
          "Mod+Shift+4".move-column-to-workspace = 4;
          "Mod+Shift+5".move-column-to-workspace = 5;

          # Sizing
          "Mod+R".switch-preset-column-width = _:{};
          "Mod+Shift+R".switch-preset-window-height = _:{};

          "Mod+Minus".set-column-width = "-10%";
          "Mod+Equal".set-column-width = "+10%";
          "Mod+Shift+Minus".set-window-height = "-10%";
          "Mod+Shift+Equal".set-window-height = "+10%";
        };

        layout = {
          gaps = 5;

          default-column-width = {
            proportion = 0.33333;
          };

          preset-column-widths = [
            { proportion = 0.33333; }  
            { proportion = 0.5; }  
            { proportion = 0.66667; }  
            { fixed = 750; }  
          ];

          preset-window-heights = [
            { proportion = 0.5; }  
            { proportion = 0.66667; }  
            { proportion = 1.0; }  
            { fixed = 750; }  
          ];

          focus-ring = {
            enable = true;
            width = 2;
          };

          border = {
            enable = false;
            width = 2;
          };

          insert-hint = {
            enable = true;
          };
        };
      };
    };
  };
}
