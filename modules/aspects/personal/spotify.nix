{ ... }:
{
  personal.spotify = {
    homeManager = { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;

      home.packages = with pkgs; [
        spotify
      ];
    };
  };
}
