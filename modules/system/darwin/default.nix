{ ... }:
{
  imports = [
    ./keyboard.nix
    ./homebrew.nix
    ./orbstack.nix
  ];

  users.users.csimms = {
    home = "/Users/csimms/";
  };
}
