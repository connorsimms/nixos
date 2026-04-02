{ personal, __findFile ? __findFile, ... }:
{
  personal.terminal = {
    homeManager = { config, pkgs, ... }: {
      
      # Terminal
      programs.kitty = {
        enable = true;
        settings = {
          scrollback_lines = 10000;
          enable_audio_bell = false;
          update_check_interval = 0;
          # font_family = "JetBrainsMono Nerd Font"; # Uncomment if you install a Nerd Font!
          window_padding_width = 4;
        };
      };

      # Multiplexer
      programs.tmux = {
        enable = true;
      };
      
      xdg.configFile."tmux/tmux.conf".source = 
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/dotfiles/tmux/tmux.conf";

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
