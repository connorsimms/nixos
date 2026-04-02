# Bootstraps framework with flake-file and den
# You probably shouldn't change this file...
# If you do, run 'nix run .#write-flake' 
{ inputs, lib, ... }:
{
  flake-file.inputs.flake-file.url = lib.mkDefault "github:vic/flake-file";
  flake-file.inputs.den.url = lib.mkDefault "github:vic/den";

  imports = [
    (inputs.flake-file.flakeModules.dendritic or { })
    (inputs.den.flakeModules.dendritic or { })
  ];
}
