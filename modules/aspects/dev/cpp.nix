{ ... }:
{
  dev.cpp = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        clang-tools
        cmake
        bazel
        ninja
      ];
    };
  };
}
