{ self, inputs, ... }:
let
  userName = "csimms";
in
{
  # NixOS Level
  flake.modules.nixos.user = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    users.users.${userName} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
      ];
    };
  };

  # DarwinOS Level
  flake.modules.darwin.user = {
  };

  # User Level
  flake.modules.homeManager.user = { pkgs, ... }: {
    home.username = userName;
    home.homeDirectory = "/home/${userName}";
    home.stateVersion = "25.11";

    programs.home-manager.enable = true;
  };
}
