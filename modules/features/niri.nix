{ self, inputs, ... }:

{
  # OS Level
  flake.modules.nixos.niri = { pkgs, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  # User Level (Dotfiles/user-apps related to Niri)
  flake.modules.homeManager.niri = { pkgs, ... }: {
    home.packages = with pkgs; [
      
    ];
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        prefer-no-csd = true;

        spawn-at-startup = [
	  (lib.getExe self'.packages.myNoctalia)
        ];

        input = {
          keyboard = {
            xkb = {
              layout = "us";
              options = "ctrl:nocaps,altwin:swap_alt_win";
            };

            repeat-delay = 450;
            repeat-rate = 20;
          };
        };

        outputs."Samsung" = {
          mode = "5120x1440";
        };

        binds = {
          "Mod+T".spawn-sh = lib.getExe pkgs.kitty;
          "Mod+Q".close-window = _: {};
        };

        layout = {
          gaps = 5;
        };
      };
    };
  };
}
