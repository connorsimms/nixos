{ ... }:
{
  imports = [
    ./keyboard.nix
    ./homebrew.nix
    ./fonts.nix
    ./orbstack.nix
  ];

  users.users.csimms = {
    home = "/Users/csimms/";
  };
}
