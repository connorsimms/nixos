{ self, inputs, ... }:

{
  # NixOS Level
  flake.modules.nixos.NAME = { pkgs, ... }: {
  };

  # DarwinOS Level
  flake.modules.darwin.NAME = { pkgs, ... }: {
  };

  # User Level
  flake.modules.homeManager.NAME = { pkgs, ... }: {
  };
}
