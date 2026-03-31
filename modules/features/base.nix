{ self, inputs, ... }:

# Absolute essentials
let
  tools = pkgs: with pkgs; [
    wget
    curl
    git
    vim
    unzip
  ];
in

{
  # If we have root
  flake.modules.nixos.base = { pkgs, ... }: {
    environment.systemPackages = tools pkgs;
  };

  # Otherwise, keep in user space
  flake.modules.homeManager.base = { pkgs, ... }: {
    home.packages = tools pkgs;
  };
}
