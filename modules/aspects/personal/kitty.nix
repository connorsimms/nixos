{ ... }:
{
  personal.kitty = {
    homeManager = { ... }: {
      programs.kitty = {
        enable = true;

        themeFile = "GruvboxMaterialDarkHard";
        font = {
          name = "0x Proto Nerd Font";
          size = 11;
        };

        settings = {
          shell = "zsh";

          window_padding_width = 0;
          placement_strategy = "center";

          bacgkround_opacity = "0.85";
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
  };
}
