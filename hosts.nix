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

  # `nix flake check` only runs checks for the current system, and it does not
  # understand darwinConfigurations at all, so the hosts are listed explicitly.
  # Use `nix flake check --all-systems` to evaluate the other host too.
  checks = {
    aarch64-darwin.macbook = darwinConfigurations.macbook.system;
    x86_64-linux.desktop = nixosConfigurations.desktop.config.system.build.toplevel;
  };
}
