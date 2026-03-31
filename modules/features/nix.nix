{ self, inputs, ... }:
let
  appName = "nix";
in
{
  # NixOS Level
  flake.modules.nixos.${appName} = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # DarwinOS Level
  flake.modules.darwin.${appName} = { pkgs, ... }: {
  };

  # User Level
  flake.modules.homeManager.${appName} = { pkgs, ... }: {
    nixpkgs.config.allowUnfree = true;
  };
}
