{ config, lib, pkgs, ... }:
{
  options.modules.cli.debug = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.cli.enable;
      description = "Debugging tools";
    };
  };

  config = lib.mkIf config.modules.cli.debug.enable {
    home.packages = [
      pkgs.lldb
      pkgs.lsof
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      pkgs.strace
      pkgs.ltrace
      pkgs.valgrind
      pkgs.gdb
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [
    ];
  };
}
