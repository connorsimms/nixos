{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.fonts = {
    enable = lib.mkEnableOption "Better fonts";
  };

  # `fonts.packages` exists with compatible semantics in both NixOS and
  # nix-darwin, so this lives in the platform-neutral tree rather than being
  # duplicated per platform. It is also the only mechanism that works on both:
  # fonts installed via home-manager's `home.packages` land in
  # ~/.nix-profile/share/fonts, which macOS does not scan.
  config = lib.mkIf config.modules.fonts.enable {
    fonts.packages = [
      pkgs.nerd-fonts.jetbrains-mono
    ];
  };
}
