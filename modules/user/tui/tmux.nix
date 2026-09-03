{
  config,
  lib,
  inputs,
  ...
}:
{
  options.modules.tmux = {
    enable = lib.mkEnableOption "Tmux";
  };

  config = lib.mkIf config.modules.tmux.enable {
    programs.tmux = {
      enable = true;
    };

    xdg.configFile."tmux/tmux.conf" = {
      source = inputs.self + "/dotfiles/tmux/tmux.conf";
    };
  };
}
