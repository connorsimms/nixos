{ personal, __findFile ? __findFile, ... }:
{
  dev.python = {
    homeManager = { pkgs, ... }: {
      home.packages = with pkgs; [
        python3         # Interpreter
        pyright         # LSP
        ruff            # Linter/Formatter
      ];
    };
  };
}
