{ personal, __findFile ? __findFile, ... }:
{
  personal.APP_NAME = {
    # NixOS System Configuration
    nixos = { pkgs, ... }: {
      # environment.systemPackages = [ pkgs.APP_NAME ];
    };

    # nix-darwin System Configuration
    darwin = { pkgs, ... }: {
      # environment.systemPackages = [ pkgs.APP_NAME ];
      # homebrew.casks = [ "APP_NAME" ]; # You can even use Homebrew here!
    };

    # Home Manager Configuration
    homeManager = { config, pkgs, lib, ... }: {
      # home.packages = [ pkgs.APP_NAME ];
      
      # xdg.configFile."app/config".source = 
    };
  };
}
