{ personal, __findFile ? __findFile, ... }:
{
  personal.rust = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        cargo           # Package manager
        rustc           # Compiler
        rustfmt         # Formatter
        clippy          # Linter
        rust-analyzer   # LSP
      ];
    };
  };
}
