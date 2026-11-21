{
  description = "C++ project";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-darwin"
        "x86_64-linux"
        "aarch64-linux"
      ];
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          # Swap for `pkgs.llvmPackages.stdenv` to build with clang.
          stdenv = pkgs.gccStdenv;
        in
        {
          default = pkgs.mkShell.override { inherit stdenv; } {
            packages = [
              pkgs.cmake
              pkgs.ninja
              # Pins clang-format/clang-tidy for everyone working on the project.
              pkgs.clang-tools
              pkgs.lldb
            ]
            ++ pkgs.lib.optionals stdenv.hostPlatform.isLinux [
              pkgs.gdb
            ];
          };
        }
      );
    };
}
