{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.cli.build = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.modules.cli.enable;
      description = "Baseline build tools";
    };
  };

  # A fallback toolchain for quick hacking outside a project. Project devshells
  # (templates/) put their own versions first on PATH under direnv.
  config = lib.mkIf config.modules.cli.build.enable {
    home.packages = [
      pkgs.cmake
      pkgs.ninja
      pkgs.uv
    ];

    # CMake reads these from the environment when the cache doesn't set them,
    # so every configure emits a compile_commands.json for clangd.
    home.sessionVariables = {
      CMAKE_EXPORT_COMPILE_COMMANDS = "ON";
      CMAKE_COLOR_DIAGNOSTICS = "ON";
    };
  };
}
