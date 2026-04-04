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
