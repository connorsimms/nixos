{ config, pkgs, ... }:

{
  home.username = "csimms";
  home.homeDirectory = "/home/csimms";
  home.stateVersion = "25.11";

  # User Packages
  home.packages = with pkgs; [
    gh
    tealdeer
    bat
    tree
  ];

  # Programs Configuration
  programs.bash = {
    enable = true;
  };
}
