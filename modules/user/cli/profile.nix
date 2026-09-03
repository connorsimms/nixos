{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.cli.profile = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.cli.enable;
      description = "Performance profiling / benchmarking tools";
    };
  };

  config = lib.mkIf config.modules.cli.profile.enable {
    home.packages = [
      pkgs.hyperfine
      pkgs.samply
      pkgs.flamegraph
      pkgs.gnuplot
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      pkgs.sysstat
      pkgs.bpftrace
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [
    ];
  };
}
