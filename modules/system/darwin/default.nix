{ ... }:
{
  imports = [
    ./keyboard.nix
    ./homebrew.nix
    ./fonts.nix
    ./orbstack.nix
    ./spotify.nix
    ./chrome.nix
    ./turkey.nix
  ];

  users.users.csimms = {
    home = "/Users/csimms/";
  };
}
