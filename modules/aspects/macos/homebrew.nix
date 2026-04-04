{ macos, ... }:
{
  macos.homebrew = {
    darwin = { pkgs, ... }: {
      homebrew = {
        enable = true;
        
        onActivation = {
          autoUpdate = true;
          upgrade = true;
          cleanup = "zap";
        };

        caskArgs.no_quarantine = true;

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
    };
  };
}
