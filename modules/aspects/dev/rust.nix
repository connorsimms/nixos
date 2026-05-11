{ ... }:
{
  dev.rust = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        rustfmt
        clippy
      ];
    };
  };
}
