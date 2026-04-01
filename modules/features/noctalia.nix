{ self, inputs, ... }:

{
  # User Level 
  flake.modules.homeManager.noctalia = { pkgs, ... }: {
    programs.noctalia-shell = {
      enable = true;
    };
  };
}
