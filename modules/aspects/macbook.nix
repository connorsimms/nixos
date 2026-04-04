{ den, __findFile ? __findFile, ... }:
{
  den.aspects.macbook = {
    
    includes = [
      # TODO: Add Aerospace
      # <personal/aerospace>
    ];

    darwin = { pkgs, ... }: {
      
      # Keyboard Remapping
      system.keyboard.enableKeyMapping = true;
      system.keyboard.remapCapsLockToControl = true;

      # Homebrew (For stuff that Homebrew does better than Nix)
      homebrew = {
        enable = true;
        
        # Ensures brew is updated & packages upgraded on rebuild
        onActivation = {
          autoUpdate = true;
          upgrade = true;
          cleanup = "zap";
        };

        taps = [
          "tikitabobko/tap"
        ];
        
        brews = [
        ];

        casks = [
          "aerospace"
          "discord"
          "spotify"
          "obsidian"
        ];
      };
    };
  };
}
