{ config, lib, pkgs, ... }:
{
  options.modules.zsh = {
    enable = lib.mkEnableOption "Zsh";
  };

  config = lib.mkIf config.modules.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      history = {
        size = 10000;
        save = 10000;
        ignoreSpace = true;
        ignoreAllDups = true;
        share = true;
      };

      shellAliases = {
        ls = "eza --icons";
        ll = "eza -l --icons";
        la = "eza -la --icons";

        tree = "eza --tree --icons";
        cat = "bat";
      };

      sessionVariables = {
        MANPAGER = "sh -c 'col -bx | bat -l man -p'";
        MANROFFOPT = "-c";
      };
    };

    home.packages = [
      pkgs.eza
      pkgs.bat
    ];
  };
}
