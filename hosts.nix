{ inputs, ... }:
let inherit (inputs)
  nixpkgs home-manager darwin;
in
{
  # `nixos-rebuild (switch) --flake <path-to-flake>#<hostname>`
  # `nixos-rebuild (switch) --flake github:<owner>/<repo>#<hostname>`
  nixosConfigurations = {
    desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/desktop.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };
  };
  # `darwin-rebuild (switch) --flake <path-to-flake>#<hostname>`
  # `darwin-rebuild (switch) --flake github:<owner>/<repo>#<hostname>`
  darwinConfigurations = {
    macbook = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/macbook.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };
  };
  # Non-sudo privilege hosts
  # `home-manager (switch) --flake <path-to-flake>#<user>@<host>`
  # `home-manager (switch) --flake github:<owner>/<repo>#<user>@<host>`
  homeConfigurations = {
    "csimms@server" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      extraSpecialArgs = { inherit inputs; };
      modules = [
        ./hosts/server.nix
      ];
    };
  };
}
