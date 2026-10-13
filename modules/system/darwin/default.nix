{ ... }:
{
  imports = [
    ./anki.nix
    ./keyboard.nix
    ./homebrew.nix
    ./orbstack.nix
    ./spotify.nix
    ./chrome.nix
    ./turkey.nix
  ];

  users.users.csimms = {
    home = "/Users/csimms/";
  };
}
