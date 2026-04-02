{ personal, __findFile ? __findFile, ... }:
{
  personal.zen-browser = {
    
    nixos = { pkgs, ... }: {
      environment.systemPackages = [ pkgs.zen-browser ];
    };

    # 2. macOS Installation (Routed to Homebrew)
    # Applied automatically when building your nix-darwin MacBook
    darwin = { ... }: {
      homebrew.casks = [ "zen-browser" ];
    };

    # 3. Universal User Configuration (Optional)
    # Applied to BOTH systems via Home Manager. 
    # Great for syncing cross-platform dotfiles later!
    # homeManager = { config, ... }: {
    #   xdg.configFile."zen/profiles.ini".text = ''...'';
    # };
    
  };
}
