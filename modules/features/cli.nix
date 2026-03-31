{ self, inputs, ... }:
let
  name = "cli";
in
{
  # User Level
  flake.modules.homeManager.${name} = { pkgs, ... }: {
    home.packages = with pkgs; [
      ripgrep
      tree
      tealdeer
    ];

    programs.gh = {
      enable = true;
      # Other settings...
    };

    programs.bat = {
      enable = true;
      # Other settings...
    };
  };
}
