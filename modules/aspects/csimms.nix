{ den, __findFile ? __findFile, ... }:
{
  den.aspects.csimms = {
    includes = [
      <den/primary-user>

      <personal/cli>
      <personal/ghostty>
      <personal/kitty>
      <personal/neovim>
      <personal/sioyek>
      <personal/tmux>
      <personal/vim>
      <personal/zen>
      <personal/zsh>

      <dev/cpp>
      <dev/python>
      <dev/rust>
      <dev/tools>
    ];
  };
}
