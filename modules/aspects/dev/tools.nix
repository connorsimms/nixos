{ ... }:
{
  dev.tools = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        lldb
        clang-tools
        hyperfine
      ];
    };

    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        gdb
        strace
        valgrind
        perf
        bpftrace
        bcc
      ];
    };

    darwin = { pkgs, ... }: {
    };
  };
}
