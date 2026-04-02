{ den, __findFile ? __findFile, ... }:
{
  # user aspect
  den.aspects.csimms = {
    includes = [
      <den/primary-user>
      (<den/user-shell> "fish")

      <personal/niri>
      <personal/firefox>
    ];

    homeManager =
      { config, pkgs, ... }:
      {
        home.packages = with pkgs; [ 
          git
          gh
          vim
          tmux
          kitty
          firefox
          rofi
        ];
 
      };

    # user can provide NixOS configurations
    # to any host it is included on
    provides.to-hosts.nixos = { pkgs, ... }: { 
    };
  };
}
