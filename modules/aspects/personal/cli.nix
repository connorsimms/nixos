{ ... }:
{
  personal.cli = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        btop
        fd
        fzf
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
        nix-direnv.enable = true;
      };

      programs.eza = {
        enable = true;
        enableZshIntegration = true;
        icons = "auto";
        git = true;
      };

      programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}
