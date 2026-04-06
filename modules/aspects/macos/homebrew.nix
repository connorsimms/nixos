{ macos, inputs, ... }:
{
  macos.homebrew = {

    darwin = { pkgs, ... }: {

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
          "zen"
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
