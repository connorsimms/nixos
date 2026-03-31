{
  description = "NixOS Config";

  inputs = {
    # Latest Versions
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Dendritic Pattern
    flake-parts.url = "github:hercules-ci/flake-parts";

    # Importing Recursively
    import-tree.url  = "github:vic/import-tree";

    # Configuring Programs
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";

    # Manager for user dotfiles and packages
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake
    { inherit inputs; }
    (inputs.import-tree ./modules);
}
