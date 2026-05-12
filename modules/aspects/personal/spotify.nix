{ ... }:
{
  personal.spotify = {
    homeManager = { ... }: {
      programs.spotify-player = {
        enable = true;
        settings = {
          theme = "gruvbox-material";
          playback_format = "{track} - {artist}";
        };
      };
    };
  };
}
