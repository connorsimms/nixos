{ den, __findFile ? __findFile, ... }:
{
  den.aspects.csimms = {
    includes = [
      <den/primary-user>

      <personal/cli>
      <personal/editors>
      <personal/firefox>
      <personal/terminal>
      <personal/sioyek>

      <dev/cpp>
      <dev/python>
      <dev/rust>
      <dev/tools>
    ];

    # user can provide NixOS configurations
    # to any host it is included on
    provides.to-hosts.nixos = { pkgs, ... }: { 
    };
  };
}
