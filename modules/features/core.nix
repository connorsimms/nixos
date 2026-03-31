let
  userName = "csimms";
in
{ 
  # OS Level
  flake.nixosModules.core = {
    
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
  flake.homeManagerModules.core = {
    home.username = userName;
    home.homeDirectory = "/home/${userName}";
    home.stateVersion = "25.11";

    programs.home-manager.enable = true;
  };
}
