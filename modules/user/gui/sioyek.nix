{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.sioyek = {
    enable = lib.mkEnableOption "Sioyek PDF viewer";
  };

  config = lib.mkIf config.modules.sioyek.enable (
    lib.mkMerge [
      {
        programs.sioyek = {
          enable = true;

          config = {
            "should_launch_new_window" = "1";
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
      }

      (lib.mkIf pkgs.stdenv.isLinux {
        programs.sioyek.package = pkgs.symlinkJoin {
          name = "sioyek-wrapped";
          paths = [ pkgs.sioyek ];
          nativeBuildInputs = [ pkgs.makeWrapper ];
          postBuild = ''
            wrapProgram $out/bin/sioyek \
              --set QT_QPA_PLATFORM xcb
          '';
        };

        xdg.mimeApps.defaultApplications = {
          "application/pdf" = [ "sioyek.desktop" ];
          "application/x-pdf" = [ "sioyek.desktop" ];
        };
      })
    ]
  );
}
