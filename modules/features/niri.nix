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
        input.keyboard = {
          xkb.layout = "us";
        };

        layout.gaps = 5;

        binds = {
          "Mod+T".spawn-sh = lib.getExe pkgs.kitty;
          "Mod+Q".close-window = null;
        };
      };
    };
  };
}
