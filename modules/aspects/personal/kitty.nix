{ ... }:
{
  personal.kitty = {
    homeManager = { ... }: {
      programs.kitty = {
        enable = true;

        themeFile = "GruvboxMaterialDarkHard";

        settings = {
          shell = "zsh";

          draw_minimal_borders = "yes";
          window_padding_width = 0;
          placement_strategy = "center";

          background_opacity = "0.85";
          cursor_trail = 3;
          cursor_trail_decay = "0.1 0.3";
          cursor_trail_start_threshold = 2;
        };

        keybindings = {
          "ctrl+h" = "no_op";
          "ctrl+j" = "no_op";
          "ctrl+k" = "no_op";
          "ctrl+l" = "no_op";
        };
      };
    };

    provides.desktop = {
      homeManager = { ... }: {
        programs.kitty = {
          font = {
            name = "JetBrainsMono Nerd Font";
            size = 11;
          };
        };
      };
    };

    provides.macbook = {
      homeManager = { ... }: {
        programs.kitty = {
          font = {
            name = "JetBrainsMono Nerd Font Mono";
            size = 11;
          };

          settings = {
            background_blur = 1;
          };
        };
      };
    };
  };
}
