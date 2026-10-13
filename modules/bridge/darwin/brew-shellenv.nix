{ config, lib, ... }:
{
  # Homebrew's shellenv belongs in the system zsh init (/etc/zshenv) so that
  # nix and home-manager paths are prepended *after* it and still win. Keeping
  # it here rather than in modules/system/darwin/homebrew.nix means it is
  # genuinely conditional on a user having enabled zsh: programs.zsh.enable is
  # set from the user tree by modules/bridge/zsh.nix.
  config = lib.mkIf (config.homebrew.enable && config.programs.zsh.enable) {
    programs.zsh.shellInit = ''
      eval "$(${config.homebrew.prefix}/bin/brew shellenv)"
    '';
  };
}
