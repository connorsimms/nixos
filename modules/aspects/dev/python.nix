{ ... }:
{
  dev.python = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        pyright
        ruff
      ];
    };
  };
}
