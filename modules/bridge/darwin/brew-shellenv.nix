{ config, lib, ... }:
{
  config = lib.mkIf (config.homebrew.enable && config.programs.zsh.enable) {
    programs.zsh.shellInit = ''
      eval "$(${config.homebrew.prefix}/bin/brew shellenv)"
    '';
  };
}
