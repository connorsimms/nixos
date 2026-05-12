{ den, __findFile ? __findFile, ... }:
{
  den.aspects.csimms = {
    includes = [
      <den/primary-user>

      <personal/cli>
      <personal/ghostty>
      <personal/vim>
      <personal/neovim>
      <personal/terminal>
      <personal/sioyek>
      <personal/zen>

      <dev/cpp>
      <dev/python>
      <dev/rust>
      <dev/tools>
    ];
  };
}
