{ self, inputs, ... }:

{
  # OS Level
  flake.modules.nixos.noctalia = { pkgs, ... }: {
    programs.noctalia-shell = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNoctalia;
    };
  };

  # User Level (Dotfiles/user-apps related to Noctalia)
  flake.modules.homeManager.noctalia = { pkgs, ... }: {
    home.packages = with pkgs; [
      
    ];
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.myNoctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      inherit pkgs;
      settings = {

      };
    };
  };
}
