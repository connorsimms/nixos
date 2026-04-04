###############################################
# Run 'nix run .#write-flake' after changing! #
###############################################
{
  flake-file.inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dotfiles = {
      url = "github:connorsimms/dotfiles";
      flake = false;
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };
}
