{ ... }:
{
  imports = [
    ./base.nix
  ];

  modules = {
    zen.enable = true;
    sioyek.enable = true;
    kitty.enable = true;
  };
}
