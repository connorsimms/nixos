{
  description = "Python project";

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
          python = pkgs.python313;
        in
        {
          default = pkgs.mkShellNoCC {
            packages = [
              python
              pkgs.uv
            ];

            # uv manages the venv and dependencies, nix supplies the
            # interpreter, so uv never downloads a Python that can't run on NixOS.
            env = {
              UV_PYTHON = "${python}/bin/python3";
              UV_PYTHON_DOWNLOADS = "never";
            }
            // pkgs.lib.optionalAttrs pkgs.stdenv.hostPlatform.isLinux {
              # manylinux wheels with C/C++ extensions expect these on the
              # loader path, which NixOS doesn't provide.
              LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
                pkgs.stdenv.cc.cc.lib
                pkgs.zlib
              ];
            };
          };
        }
      );
    };
}
