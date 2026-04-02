{ personal, __findFile ? __findFile, ... }:
{
  personal.cli = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        bat
        btop
        eza
        fd
        fzf
        ripgrep
        tealdeer
        tree
      ];

      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };

      programs.zoxide = {
        enable = true;
      };
    };
  };
}
