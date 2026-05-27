{ ... }:
{
  personal.fonts = {
    nixos = { pkgs, ... }: {
      fonts.packages = with pkgs; [
        nerd-fonts._0xproto
        nerd-fonts.jetbrains-mono
        nerd-fonts.fira-code
        nerd-fonts.iosevka
      ];
    };

    darwin = { pkgs, ... }: {
      fonts.packages = with pkgs; [
        nerd-fonts._0xproto
        nerd-fonts.jetbrains-mono
        nerd-fonts.fira-code
        nerd-fonts.iosevka
      ];
    };
  };
}
