{ personal, __findFile ? __findFile, ... }:
{
  personal.terminal = {
    homeManager = { config, pkgs, ... }: {

      home.packages = with pkgs; [
        kitty
        tmux
      ];
      
      xdg.configFile."tmux/tmux.conf".source = 
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/tmux/tmux.conf";

      xdg.configFile."kitty".source = 
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/kitty";

      # Shell
      programs.zsh = {
        enable = true;
        
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
          ls = "eza --icons";
          ll = "eza -l --icons";
          la = "eza -la --icons";
          cat = "bat";
        };
      };
    };
  };
}
