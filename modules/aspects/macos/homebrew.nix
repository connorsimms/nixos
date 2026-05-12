{ ... }:
{
  macos.homebrew = {

    darwin = { ... }: {
      homebrew = {
        enable = true;

        global.brewfile = true;

        onActivation = {
          autoUpdate = true;
          upgrade = true;
          cleanup = "zap";
        };

        taps = [ ];

        brews = [ ];

        casks = [
          "obsidian"
        ];
      };

      programs.zsh.shellInit = ''
        eval "$(/opt/homebrew/bin/brew shellenv)"
      '';
    };
  };
}
