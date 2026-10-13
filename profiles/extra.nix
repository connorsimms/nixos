{ ... }:
{
  imports = [
    ./base.nix
  ];

  modules = {
    firefox.enable = true;
    zen.enable = true;
    sioyek.enable = true;
    kitty.enable = true;
  };
}
