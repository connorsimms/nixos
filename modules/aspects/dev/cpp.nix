{ personal, __findFile ? __findFile, ... }:
{
  personal.cpp = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        # Compile
        gcc clang ccache
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
