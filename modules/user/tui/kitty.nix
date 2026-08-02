{ config, lib, pkgs, ... }:
{
  options.modules.kitty = {
    enable = lib.mkEnableOption "Kitty configuration";

    fontSize = lib.mkOption {
      type = lib.types.int;
      default = 12;
      description = "Font size for kitty";
    };
  };

  config = lib.mkIf config.modules.kitty.enable {
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

      font = {
        name = "JetBrainsMonoNerdFont";
        package = pkgs.nerd-fonts.jetbrains-mono;
        size = config.modules.kitty.fontSize;
      };
    };
  };
}
