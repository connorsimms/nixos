{ config, lib, ... }:
{
  options.modules.firefox.enable = lib.mkEnableOption "Firefox browser";

  config = lib.mkIf config.modules.firefox.enable {
    programs.firefox = {
      enable = true;

      profiles.default = {
        isDefault = true;

        bookmarks = [
          {
            name = "Rust";
            toolbar = true;
            bookmarks = [
              {
                name = "Rust Standard Library";
                url = "https://doc.rust-lang.org/std/";
              }
              {
                name = "crates.io";
                url = "https://crates.io/";
              }
            ];
          }
          {
            name = "C++";
            toolbar = true;
            bookmarks = [
              {
                name = "cppreference.com";
                url = "https://en.cppreference.com/w/";
              }
              {
                name = "C++ Core Guidelines";
                url = "https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines";
              }
            ];
          }
          {
            name = "Compiler Explorer (Godbolt)";
            url = "https://godbolt.org/";
          }
        ];

        settings = {
          "browser.toolbars.bookmarks.visibility" = "always";
        };
      };
    };
  };
}
