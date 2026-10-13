{ inputs, ... }:
let
  inherit (inputs)
    nixpkgs
    home-manager
    darwin
    ;
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
}
