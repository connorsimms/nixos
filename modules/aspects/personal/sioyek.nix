{ personal, __findFile ? __findFile, ... }:
{
  personal.sioyek = {
    homeManager = { config, pkgs, ... }: {
      programs.sioyek = {
        enable = true;
        config = {
          "create_table_of_contents_if_not_exists" = "1";
          "max_created_toc_size" = "5000";

          "custom_color_contrast" = "0.3";

          "custom_color_mode_empty_background_color" = "#F3EAC7";
          "page_separator_color" = "#A89984";
          "page_separator_width" = "10";
          
          "custom_background_color" = "#F9F5D7";
          "custom_text_color" = "#654735";
          "search_highlight_color" = "#B47109";

          "status_bar_color" = "#F5EDCA";
          "status_bar_text_color" = "#654735";
          "status_bar_font_size" = "12";
        };
      };
    };
  };
}
