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

      environment.systemPath = [ "/opt/homebrew/bin" ];

      programs.zsh.shellInit = ''
        eval "$(/opt/homebrew/bin/brew shellenv)"
      '';
    };
  };
}
