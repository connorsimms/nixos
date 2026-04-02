{ personal, __findFile ? __findFile, ... }:
{
  personal.stylix = {
    # NixOS System Configuration
    nixos = { pkgs, ... }: {
        # cursor stuff
    };

    # nix-darwin System Configuration
    darwin = { pkgs, ... }: {
    };

    # Home Manager Configuration
    homeManager = { config, pkgs, ... }: {
      stylix = {
      enable = true;
      image = "${config.home.homeDirectory}/nixos/dotfiles/wallpapers/forest.jpg";
        base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
      };

      targets.tmux.enable = true;
      targets.vim.enable = true;
      targets.neovim.enable = true;
      targets.kitty.enable = true;
    };
  };
}
