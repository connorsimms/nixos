{ ... }:
{
  imports = [
    ./keyboard.nix
    ./homebrew.nix
    ./fonts.nix
  ];

  users.users.csimms = {
    home = "/Users/csimms/";
  };
}
