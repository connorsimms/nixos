{ config, lib, ... }:
{
  options.modules.starship = {
    enable = lib.mkEnableOption "Starship prompt";
  };

  config = lib.mkIf config.modules.starship.enable {
    programs.starship = {
      enable = true;

      settings = {
        add_newline = false;
        format = "$directory$git_branch$git_status$character";

        directory = {
          style = "bold #d79921";
          read_only = " 󰌾";
          truncation_length = 3;
          truncate_to_repo = false;
        };

        git_branch = {
          style = "bold #b8bb26";
          format = "[$symbol$branch]($style) ";
        };

        git_status = {
          style = "bold #fb4934";
          format = "([$all_status$ahead_behind]($style) )";
        };

        character = {
          success_symbol = "[❯](bold #b8bb26)";
          error_symbol = "[❯](bold #fb4934)";
        };
      };
    };
  };
}
