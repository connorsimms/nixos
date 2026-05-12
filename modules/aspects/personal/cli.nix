{ ... }:
{
  personal.cli = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        btop
        fd
        git
        gh
        ripgrep
        tealdeer
        tree
      ];

      programs.bat = {
        enable = true;
        config = {
          theme = "gruvbox-dark";
        };
      };

      programs.direnv = {
        enable = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
      };

      programs.eza = {
        enable = true;
        enableZshIntegration = true;
        icons = "auto";
        git = true;
      };

      programs.fzf = {
        enable = true;
        enableZshIntegration = true;

        defaultCommand = "fd --type f";
        defaultOptions = [
          "--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
        ];
      };

      programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}
