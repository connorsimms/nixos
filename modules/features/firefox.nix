{ self, imports, ... }:
let
  appName = "firefox";
in
{
  # NixOS Level
  flake.modules.nixos.${appName} = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      
    ];
  };

  # DarwinOS Level
  flake.modules.darwin.${appName} = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [

    ];
  };

  # User Level
  flake.modules.homeManager.${appName} = { pkgs, ... }: {
    programs.${appName} = {
      enable = true;
      # Other settings...
    };
  };
}
