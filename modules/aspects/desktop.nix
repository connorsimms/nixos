{ den, __findFile ? __findFile, ... }:
{
  den.aspects.desktop = {
    includes = [
      <linux/keyboard>
      <linux/niri>
      <linux/graphics>
      <linux/nvidia>
      <linux/pipewire>
    ];

    provides.csimms.includes = [
      <linux/niri>
    ];

    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        wget
        curl
      ];
    };
  };
}
