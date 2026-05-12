{ ... }:
{
  linux.ly = {
    nixos = { pkgs, ... }: {
      services.displayManager.ly = {
        enable = true;
        package = pkgs.ly;
        settings = {
          animation = "colormix";
          animate = true;
        };
      };
    };
  };
}
