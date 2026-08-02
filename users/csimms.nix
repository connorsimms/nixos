{ ... }:
{
  imports = [
    ../modules/user
  ];

  modules = {
    cli.enable = true;
    neovim.enable = true;
    firefox.enable = true;
    fuzzel.enable = true;
    sioyek.enable = true;
    starship.enable = true;
    zsh.enable = true;
    kitty.enable = true;
    tmux.enable = true;
  };

  home.stateVersion = "26.11";
}
