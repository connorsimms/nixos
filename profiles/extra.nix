{ ... }:
{
  imports = [
    ./base.nix
  ];

  modules = {
    firefox.enable = true;
    zen.enable = true;
    sioyek.enable = true;
    starship.enable = true;
    kitty.enable = true;
  };
}
