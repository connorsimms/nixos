{ den, __findFile ? __findFile, ... }:
{
  den.aspects.macbook = {
    includes = [ 
      <macos/keyboard> 
      <macos/homebrew> 
      <macos/aerospace> 
    ];
  };
}
