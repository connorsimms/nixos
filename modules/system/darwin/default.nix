{ ... }:
{
  imports = [
    ./keyboard.nix
    ./homebrew.nix
    ./fonts.nix
    ./orbstack.nix
    ./spotify.nix
  ];

  users.users.csimms = {
    home = "/Users/csimms/";
  };
}
