{ personal, __findFile ? __findFile, ... }:
{
  personal.firefox = {
    homeManager = { config, ... }: {
      programs.firefox = {
        enable = true;
      };

      # Add config
    };
  };
}
