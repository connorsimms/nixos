{ personal, __findFile ? __findFile, ... }:
{
  personal.firefox = {
    
    nixos = { pkgs, ... }: {
      environment.systemPackages = [ pkgs.firefox ];
    };

    # 2. macOS Installation (Routed to Homebrew)
    # Applied automatically when building your nix-darwin MacBook
    darwin = { ... }: {
      homebrew.casks = [ "firefox" ];
    };

    homeManager = { config, ... }: {
    # if i ever rice
    };
    
  };
}
