{ lib, ... }:
{
  # One file per language server, each installing the binary that the matching
  # dotfiles/nvim/after/lsp/<name>.lua expects on PATH. Keep the two in step:
  # dotfiles/nvim/lua/lsp.lua enables servers by name, and a server enabled
  # there without a module here silently fails to attach.
  imports = [
    ./basedpyright.nix
    ./lua-language-server.nix
    ./nixd.nix
    ./nixfmt.nix
    ./ruff.nix
    ./rust-analyzer.nix
  ];

  options.modules.lsp.enable = lib.mkEnableOption "All LSP modules";
}
