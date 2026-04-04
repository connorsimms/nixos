{ macos, ... }:
{
  macos.homebrew = {
    darwin = { pkgs, ... }: {
      homebrew = {
        enable = true;

        prefix = "/opt/homebrew";
        
        onActivation = {
          autoUpdate = true;
          upgrade = true;
          cleanup = "zap";
        };

        taps = [
        ];
        
        brews = [
        ];

        casks = [
          "discord"
          "obsidian"
          "spotify"
        ];
      };

      programs.zsh.shellInit = ''
        eval "$(/opt/homebrew/bin/brew shellenv)"
      '';
    };
  };
}
