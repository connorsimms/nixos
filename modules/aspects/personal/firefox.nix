{ personal, __findFile ? __findFile, ... }:
{
  personal.firefox = {
    
    nixos = { pkgs, ... }: {
      environment.systemPackages = [ pkgs.firefox ];
    };

    darwin = { ... }: {
      homebrew.casks = [ "firefox" ];
    };

    homeManager = { config, ... }: {
    # if i ever rice
    };
  };
}
