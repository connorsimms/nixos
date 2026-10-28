{ ... }:
{
  imports = [
    ./keyboard.nix
    ./homebrew.nix
    ./orbstack.nix
    ./docs.nix
  ];

  users.users.csimms = {
    home = "/Users/csimms/";
  };
}
