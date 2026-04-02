{ dev, __findFile ? __findFile, ... }:
{
  dev.tools = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        gdb
        lldb
        llvm
        hyperfine
      ];
    };

    nixos = { pkgs, config, ... }: {
      environment.systemPackages = with pkgs; [
        strace
        valgrind
        config.boot.kernelPackages.perf 
        bpftrace
        bcc
      ];
    };

    darwin = { pkgs, ... }: {
    };
  };
}
