{ inputs, ... }:
let
  inherit (inputs)
    nixpkgs
    home-manager
    darwin
    ;

  forAllSystems = nixpkgs.lib.genAttrs [
    "aarch64-darwin"
    "x86_64-linux"
    "aarch64-linux"
  ];

  mkNixos =
    system: host:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        host
        home-manager.nixosModules.home-manager
        {
          home-manager.extraSpecialArgs = { inherit inputs; };
        }
      ];
    };

  # `nixos-rebuild (switch) --flake <path-to-flake>#<hostname>`
  # `nixos-rebuild (switch) --flake github:<owner>/<repo>#<hostname>`
  nixosConfigurations = {
    desktop = mkNixos "x86_64-linux" ./hosts/desktop.nix;
    orb = mkNixos "aarch64-linux" ./hosts/orb.nix;
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
in
{
  inherit nixosConfigurations darwinConfigurations;

  # `nix fmt`
  formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);

  # `nix develop`
  devShells = forAllSystems (
    system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      default = pkgs.mkShellNoCC {
        packages = [
          pkgs.nixfmt-tree
          pkgs.nixd
        ];
      };
    }
  );

  # `nix flake check` - run checks for the current system
  # `nix flake check --all-systems` - evaluate all hosts
  checks = {
    aarch64-darwin.macbook = darwinConfigurations.macbook.system;
    x86_64-linux.desktop = nixosConfigurations.desktop.config.system.build.toplevel;
    aarch64-linux.orb = nixosConfigurations.orb.config.system.build.toplevel;
  };
}
