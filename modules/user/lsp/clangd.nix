{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  options.modules.lsp.clangd = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.lsp.enable;
      description = "Clangd (with clang-format and clang-tidy)";
    };
  };

  # clangd reads its user config from ~/Library/Preferences on darwin rather
  # than XDG, so the same dotfile is linked to a per-platform location.
  config = lib.mkIf config.modules.lsp.clangd.enable (
    lib.mkMerge [
      {
        home.packages = [
          pkgs.clang-tools
        ];
      }
      (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
        home.file."Library/Preferences/clangd/config.yaml".source =
          inputs.self + "/dotfiles/clangd/config.yaml";
      })
      (lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
        xdg.configFile."clangd/config.yaml".source = inputs.self + "/dotfiles/clangd/config.yaml";
      })
    ]
  );
}
