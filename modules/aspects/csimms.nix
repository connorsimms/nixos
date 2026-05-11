{ den, __findFile ? __findFile, ... }:
{
  den.aspects.csimms = {
    includes = [
      <den/primary-user>

      <personal/cli>
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
