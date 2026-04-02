{ den, __findFile ? __findFile, ... }:
{
  # user aspect
  den.aspects.csimms = {
    includes = [
      <den/primary-user>
      (<den/user-shell> "fish")

      <personal/niri>
    ];

    homeManager =
      { config, pkgs, ... }:
      {
        home.packages = with pkgs; [ 
          gh
          kitty
          tmux
          rofi
          firefox
        ];
 
      };

    # user can provide NixOS configurations
    # to any host it is included on
    provides.to-hosts.nixos = { pkgs, ... }: { 
    };
  };
}
