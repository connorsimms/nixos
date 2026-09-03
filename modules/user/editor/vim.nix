{
  config,
  lib,
  inputs,
  ...
}:
{
  options.modules.vim = {
    enable = lib.mkEnableOption "Vim";
  };

  config = lib.mkIf config.modules.vim.enable {
    programs.vim = {
      enable = true;
      defaultEditor = !config.modules.neovim.enable;
    };

    xdg.configFile."vim/vimrc" = {
      source = inputs.self + "/dotfiles/vim/vimrc";
    };
  };
}
