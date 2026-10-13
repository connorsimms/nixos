{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.perf = {
    enable = lib.mkEnableOption "Perf";
  };

  config = lib.mkIf config.modules.perf.enable {
    # Top-level `perf`, not `boot.kernelPackages.perf` — nixpkgs moved it out of
    # the kernel package set and the old path now warns.
    environment.systemPackages = [
      pkgs.perf
    ];
  };
}
