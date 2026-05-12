{ ... }:
{
  personal.ghostty = {
    homeManager = { ... }: {
      programs.ghostty = {
        enable = true;

        enableZshIntegration = true;

        settings = {
          command = "zsh";

          font-size = 11;
          font-family = "0x Proto Nerd Font";
          background-opacity = 0.85;

          theme = "Gruvbox Material Dark";
          window-padding-y = 0;
          #window-padding-color = "extend";
          window-padding-balance = true;
        };
      };
    };
  };
}
