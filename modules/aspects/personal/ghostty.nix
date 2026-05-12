{ ... }:
{
  personal.ghostty = {
    homeManager = { ... }: {
      programs.ghostty = {
        enable = true;

        enableBashIntegration = true;
        enableZshIntegration = true;

        settings = {
          theme = "Gruvbox Material Dark";
          window-padding-x = 0;
          window-padding-y = 0;
          #window-padding-color = "extend";
          window-padding-balance = true;
          font-size = 11;
          font-family = "0x Proto Nerd Font";
          background-opacity = 0.85;
        };
      };
    };
  };
}
