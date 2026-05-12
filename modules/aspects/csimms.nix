{ den, __findFile ? __findFile, ... }:
{
  den.aspects.csimms = {
    includes = [
      <personal/cli>
      <personal/neovim>
      <personal/tmux>
      <personal/vim>
      <personal/zsh>

      <dev/cpp>
      <dev/python>
      <dev/rust>
      <dev/tools>
    ];

    provides.desktop.includes = [
      <den/primary-user>
      <personal/kitty>
      <personal/sioyek>
      <personal/spotify>
      <personal/vesktop>
      <personal/zen>
    ];

    provides.macbook.includes = [
      <den/primary-user>
      <personal/kitty>
      <personal/sioyek>
      <personal/spotify>
      <personal/vesktop>
      <personal/zen>
    ];
  };
}
