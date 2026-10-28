{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.modules.docs = {
    enable = lib.mkEnableOption "Man pages and documentation";
  };

  config = lib.mkIf config.modules.docs.enable {
    documentation = {
      enable = true;
      man.enable = true;
      info.enable = true;
      doc.enable = true;
      nixos.enable = true;
      dev.enable = true;
      man.cache.enable = true;
    };

    environment.systemPackages = [
      pkgs.man-pages
      pkgs.man-pages-posix
    ];
  };
}
