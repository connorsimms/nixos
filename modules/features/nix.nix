{ self, inputs, ... }:

{
  # NixOS Level
  flake.modules.nixos.nix = {
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # DarwinOS Level
  flake.modules.darwin.nix = { pkgs, ... }: {
  };

  # User Level
  flake.modules.homeManager.nix = { pkgs, ... }: {
  };
}
