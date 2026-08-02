{ ... }:
{
  imports = [
    ./keyboard.nix
    ./homebrew.nix
  ];

  users.users.csimms = {
    home = "/Users/csimms/";
  };
}
