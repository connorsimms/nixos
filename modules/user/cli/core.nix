{ config, lib, pkgs, ... }:
{
  options.modules.cli.core = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.cli.enable;
      description = "Core CLI tools";
    };
  };

  config = lib.mkIf config.modules.cli.core.enable {
    modules.cli.git.enable = lib.mkDefault true;
    modules.cli.gh.enable = lib.mkDefault true;

    home.packages = [
      pkgs.btop
      pkgs.fd
      pkgs.ripgrep
      pkgs.tealdeer
      pkgs.tree
      pkgs.jq
    ];

    programs.bat = {
      enable = true;
      config = {
        theme = "gruvbox-dark";
      };
    };

    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    programs.eza = {
      enable = true;
      enableZshIntegration = true;
      icons = "auto";
      git = true;
    };

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;

      defaultCommand = "fd --type f";
      defaultOptions = [
        "--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
      ];
    };

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
