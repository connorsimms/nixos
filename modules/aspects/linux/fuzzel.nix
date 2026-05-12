{ ... }:
{
  linux.fuzzel = {
    homeManager = { ... }: {
      programs.fuzzel = {
        enable = true;
      };
    };
  };
}
