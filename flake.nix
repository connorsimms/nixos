{
  description = "NixOS Config";

  inputs = {
    # Latest Versions
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Manager for user dotfiles and packages
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      "desktop" = nixpkgs.lib.nixosSystem { # could we template this "{name}"
       system = "x86-64-linux"; # could we template this "{arch}"
       specialArgs = { inherit inputs; };
       
       modules = [
         ./hosts/desktop/default.nix # could we template this ./hosts/{name}/default.nix

         home-manager.nixosModules.home-manager
         {
           home-manager.users.csimms = {
             imports = [
               ./modules/user/core.nix
               ./modules/user/ui.nix
             ];
           };
         }
       ];
      };
    };
    homeConfigurations = {
      "csimms@macbook" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."aarch64-darwin";
        extraSpecialArgs = { inherit inputs; };
 
        modules = [
          ./modules/user/core.nix
        ];
      };
    };
  };
}
