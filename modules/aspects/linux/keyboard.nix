{ linux, ... }:
{
  linux.keyboard = {
    nixos = { ... }: {
      services.xserver.xkb = {
        layout = "us";
        options = "caps:ctrl_modifier,altwin:swap_alt_win";
      };
      console.useXkbConfig = true;
    };
  };
}
