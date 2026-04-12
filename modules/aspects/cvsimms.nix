{ den, __findFile ? __findFile, ... }:
{
  den.aspects.cvsimms = {
    includes = [
      <personal/vim>
      <personal/neovim>
    ];

    # user can provide NixOS configurations
    # to any host it is included on
    provides.to-hosts.nixos = { pkgs, ... }: { 
    };
  };
}
