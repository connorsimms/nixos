{ lib, den, __findFile ? __findFile, ... }:
{
  den.default = {
    nixos = {
      system.stateVersion = "25.11";

      nixpkgs.config.allowUnfree = true;

      nix.settings.experimental-features = [ 
        "nix-command" 
        "flakes"
      ];
    };

    darwin = {
      system.stateVersion = 6;

      nixpkgs.config.allowUnfree = true;

      nix.settings.experimental-features = [ 
        "nix-command" 
        "flakes"
      ];
    };

    homeManager = {
      home.stateVersion = "25.11";
    };

    includes = [
      <den/hostname>
      <den/define-user>
    ];
  };

  # enable hm by default
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];

  # host<->user provides
  den.ctx.user.includes = [ <den/mutual-provider> ];
}
