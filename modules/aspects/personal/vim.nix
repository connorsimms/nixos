{ personal, inputs, ... }:
{
  personal.vim = {
    homeManager = { config, pkgs, ... }: {
      programs.vim = {
        enable = true;
      };

      xdg.configFile."vim/vimrc" = {
        source = inputs.self + "/dotfiles/vim/vimrc";
      };
    };
  };
}
