{ ... }:
{
  imports = [
    ../modules/user
  ];

  modules = {
    lsp.enable = true;
    cli.enable = true;
    neovim.enable = true;
    starship.enable = true;
    zsh.enable = true;
    tmux.enable = true;
  };
}
