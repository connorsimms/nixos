{ self, inputs, ... }:

let
  userName = "csimms";
in
{ 
  # OS Level
  flake.modules.nixos.core = {
    
    # What happens if we don't have OS level authority? But we still can use home-manager?
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

    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # User Level
  flake.modules.homeManager.core = {
    home.username = userName;
    home.homeDirectory = "/home/${userName}";
    home.stateVersion = "25.11";

    programs.home-manager.enable = true;
  };
}
