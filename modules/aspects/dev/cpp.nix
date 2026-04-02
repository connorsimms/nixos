{ personal, __findFile ? __findFile, ... }:
{
  dev.cpp = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        # Compile
        gcc ccache
        # Debug
        gdb lldb
        # Build
        cmake bazel ninja
        # Tool
        clang-tools
      ];
    };
  };
}
