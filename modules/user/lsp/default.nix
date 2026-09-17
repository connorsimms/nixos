{ lib, ... }:
{
  imports = [
    ./nixd.nix
    ./nixfmt.nix
  ];

  options.modules.lsp.enable = lib.mkEnableOption "All LSP modules";
}
