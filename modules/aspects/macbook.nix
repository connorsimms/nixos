{ den, __findFile ? __findFile, ... }:
{
  den.aspects.macbook = {
    
    includes = [
      # <personal/paneru>  # A tiling window manager for macOS
    ];

    darwin = { pkgs, ... }: {
      
      # Keyboard Remapping
      system.keyboard.enableKeyMapping = true;
      system.keyboard.remapCapsLockToControl = true;
      system.keyboard.swapLeftCommandAndLeftAlt = true;

      # Homebrew (For stuff that Homebrew does better than Nix)
      homebrew = {
        enable = true;
        
        # Ensures brew is updated & packages upgraded on rebuild
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;

        # Removes packages not explicitly defined below
        onActivation.cleanup = "zap"; 
      };
    };
  };
}
