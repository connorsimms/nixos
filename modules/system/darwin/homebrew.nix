{ config, lib, inputs, ... }:
{
  imports = [
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  options.modules.homebrew = {
    enable = lib.mkEnableOption "Homebrew";
  };

  config = lib.mkIf config.modules.homebrew.enable {
    nix-homebrew = {
      enable = true;
      user = "csimms";
      autoMigrate = true;
    };

    homebrew = {
      enable = true;
      global.brewfile = true;

      onActivation = {
        autoUpdate = true;
        upgrade = true;
        cleanup = "zap";
      };
    };

    programs.zsh.shellInit = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
  };
}
