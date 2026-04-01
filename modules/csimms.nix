{ den, ... }:
{
  # user aspect
  den.aspects.csimms = {
    includes = [
      den.provides.primary-user
      (den.provides.user-shell "fish")
    ];

    homeManager =
      { config, pkgs, ... }:
      {
        home.packages = with pkgs; [ 
          kitty
          tmux
          rofi
        ];
 
        xdg.configFile."niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "/home/csimms/nixos/dotfiles/niri/config.kdl";        
      };

    # user can provide NixOS configurations
    # to any host it is included on
    provides.to-hosts.nixos = { pkgs, ... }: { 
    };
  };
}
