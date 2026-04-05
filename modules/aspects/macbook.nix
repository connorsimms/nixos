{ den, inputs, __findFile ? __findFile, ... }:
{
  den.aspects.macbook = {
    includes = [ 
      <macos/keyboard> 
      <macos/homebrew> 
      <macos/aerospace> 
      <macos/jankyborders> 
    ];

    darwin = {
      imports = [
        inputs.nix-homebrew.darwinModules.nix-homebrew
      ];

      nix-homebrew = {
        enable = true;
        user = "csimms";
        autoMigrate = true;
      };
    };
  };
}
